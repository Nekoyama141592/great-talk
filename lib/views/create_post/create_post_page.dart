import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:great_talk/consts/form_consts.dart';
import 'package:great_talk/extensions/string_extension.dart';
import 'package:great_talk/model/view_model_state/create_post/create_post_state.dart';
import 'package:great_talk/providers/view_model/create_post/create_post_view_model.dart';
import 'package:great_talk/ui_core/form_ui_core.dart';
import 'package:great_talk/views/common/forms_screen.dart';
import 'package:great_talk/views/components/rounded_button.dart';
import 'package:great_talk/views/create_post/components/form_label.dart';
import 'package:great_talk/views/create_post/components/original_form.dart';
import 'package:great_talk/views/generate_image/generate_image_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ConsumerWidgetに変更してStatefulWidgetとStateを削除
class CreatePostPage extends ConsumerWidget {
  CreatePostPage({super.key});
  static const path = "/createPost";

  // FormKeyをウィジェットのメンバとして保持
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final viewModel = ref.read(createPostViewModelProvider.notifier);
    final stateAsync = ref.watch(createPostViewModelProvider);
    final state = stateAsync.value; // CreatePostStateを取得

    return FormsScreen(
      appBarText: "投稿を作成",
      children: [
        _createPostForm(context, viewModel, state, deviceHeight),
        _image(context, viewModel, state),
        _positiveButton(context, ref, stateAsync.isLoading)
      ],
    );
  }

  // 画像表示/選択ウィジェット
  Widget _image(BuildContext context, CreatePostViewModel viewModel,
      CreatePostState? state) {
    final pickedImageBase64 = state?.pickedImage;
    final Uint8List? imageBytes =
        pickedImageBase64 != null ? base64Decode(pickedImageBase64) : null;

    return imageBytes == null
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: viewModel.onImagePickButtonPressed,
                child: const Icon(
                  Icons.image,
                  size: 100.0,
                ),
              ),
              const SizedBox(width: 16),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(FormConsts.imageLabel), ToGeneratePageButton()],
              )
            ],
          )
        : InkWell(
            onTap: viewModel.onImagePickButtonPressed,
            child: SizedBox(
                width: 100.0, height: 100.0, child: Image.memory(imageBytes)),
          );
  }

  // 送信ボタンウィジェット
  Widget _positiveButton(BuildContext context, WidgetRef ref, bool isLoading) {
    return RoundedButton(
        text: "送信",
        // ローディング中はnullを渡し、ボタンを非活性化
        press: isLoading ? null : () => _onPositiveButtonPressed(ref),
        buttonColor: Theme.of(context).primaryColor,
        textColor: Colors.white);
  }

  // 送信ボタン押下時の処理
  void _onPositiveButtonPressed(WidgetRef ref) async {
    final form = _formKey.currentState;
    if (form == null || !form.validate()) {
      return;
    }
    form.save();
    await ref
        .read(createPostViewModelProvider.notifier)
        .onPositiveButtonPressed();
  }

  // 投稿フォーム全体
  Widget _createPostForm(BuildContext context, CreatePostViewModel viewModel,
      CreatePostState? state, double deviceHeight) {
    return SizedBox(
      height: deviceHeight * 0.50,
      child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ..._systemPromptTextField(viewModel,
                    state?.systemPrompt ?? FormConsts.defaultSystemPrompt),
                ..._descriptionTextField(viewModel, state?.description ?? ''),
                ..._titleTextField(viewModel, state?.title ?? ''),
                ..._temperatureNumberField(
                    viewModel,
                    state?.temperature.toString() ??
                        FormConsts.defaultTemperature.toString()),
                ..._topPNumberField(
                    viewModel,
                    state?.topP.toString() ??
                        FormConsts.defaultTopP.toString()),
                ..._presencePenaltyNumberField(
                    viewModel,
                    state?.presencePenalty.toString() ??
                        FormConsts.defaultPresencePenalty.toString()),
                ..._frequencyPenaltyNumberField(
                    viewModel,
                    state?.frequencyPenalty.toString() ??
                        FormConsts.defaultFrequencyPenalty.toString())
              ],
            ),
          )),
    );
  }

  List<Widget> _systemPromptTextField(
      CreatePostViewModel viewModel, String initialValue) {
    return [
      const FormLabel(
          title: "システムプロンプト", helpMsg: FormConsts.systemPromptHelpMsg),
      OriginalForm(
        initialValue: initialValue,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        onSaved: viewModel.setSystemPrompt,
        validator: (value) {
          if (value!.isEmpty) {
            return "入力をしてください";
          } else if (value.length > FormConsts.maxSystemPromptLimit) {
            return FormConsts.textLimitMsg(
                FormConsts.maxSystemPromptLimit, value);
          } else if (value == FormConsts.defaultSystemPrompt) {
            return "初期値から変更してください。";
          } else {
            return null;
          }
        },
      )
    ];
  }

  List<Widget> _descriptionTextField(
      CreatePostViewModel viewModel, String initialValue) {
    return [
      const FormLabel(
          title: "説明/使い方(AIの一言目)", helpMsg: FormConsts.descriptionHelpMsg),
      OriginalForm(
        initialValue: initialValue,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: const InputDecoration(hintText: FormConsts.hintDescription),
        onSaved: viewModel.setDescription,
        validator: (value) {
          if (value!.isEmpty) {
            return "入力をしてください";
          } else if (value.length > FormConsts.maxDescriptionLimit) {
            return FormConsts.textLimitMsg(
                FormConsts.maxDescriptionLimit, value);
          } else {
            return null;
          }
        },
      )
    ];
  }

  List<Widget> _titleTextField(
      CreatePostViewModel viewModel, String initialValue) {
    return [
      const FormLabel(
        title: "タイトル",
        helpMsg: FormConsts.titleHelpMsg,
      ),
      OriginalForm(
        initialValue: initialValue,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(hintText: FormConsts.hintTitle),
        onSaved: viewModel.setTitle,
        validator: (value) {
          if (value!.length < FormConsts.nGramIndex) {
            return "${FormConsts.nGramIndex}文字以上の入力をしてください";
          } else if (value.length > FormConsts.maxTitleLimit) {
            return FormConsts.textLimitMsg(FormConsts.maxTitleLimit, value);
          } else if (value.invalidField) {
            return FormUiCore.invalidFieldMsg;
          } else {
            return null;
          }
        },
      )
    ];
  }

  List<Widget> _temperatureNumberField(
      CreatePostViewModel viewModel, String initialValue) {
    return [
      const FormLabel(
          title: "temperature", helpMsg: FormConsts.temperatureHelpMsg),
      OriginalForm(
        initialValue: initialValue,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        onSaved: viewModel.setTemperature,
        validator: (value) {
          final result = double.tryParse(value!);
          if (result == null) {
            return "数字を入力してください";
          } else if (result < 0.0 || result > 2.0) {
            return "0.0以上2.0以下の値を入力してください";
          } else {
            return null;
          }
        },
      )
    ];
  }

  List<Widget> _topPNumberField(
      CreatePostViewModel viewModel, String initialValue) {
    return [
      const FormLabel(title: "topP", helpMsg: FormConsts.topPHelpMsg),
      OriginalForm(
        initialValue: initialValue,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        onSaved: viewModel.setTopP,
        validator: (value) {
          final result = double.tryParse(value!);
          if (result == null) {
            return "数字を入力してください";
          } else if (result < 0.0 || result > 1.0) {
            return "0.0以上1.0以下の値を入力してください";
          } else {
            return null;
          }
        },
      )
    ];
  }

  List<Widget> _presencePenaltyNumberField(
      CreatePostViewModel viewModel, String initialValue) {
    return [
      const FormLabel(
          title: "PresencePenalty", helpMsg: FormConsts.presencePenaltyHelpMsg),
      OriginalForm(
        initialValue: initialValue,
        keyboardType:
            const TextInputType.numberWithOptions(decimal: true, signed: true),
        onSaved: viewModel.setPresencePenalty,
        validator: (value) {
          final result = double.tryParse(value!);
          if (result == null) {
            return "数字を入力してください";
          } else if (result < -2.0 || result > 2.0) {
            return "-2.0以上2.0以下の値を入力してください";
          } else {
            return null;
          }
        },
      )
    ];
  }

  List<Widget> _frequencyPenaltyNumberField(
      CreatePostViewModel viewModel, String initialValue) {
    return [
      const FormLabel(
          title: "FrequencyPenalty",
          helpMsg: FormConsts.frequencyPenaltyHelpMsg),
      OriginalForm(
        initialValue: initialValue,
        keyboardType:
            const TextInputType.numberWithOptions(decimal: true, signed: true),
        onSaved: viewModel.setFrequencyPenalty,
        validator: (value) {
          final result = double.tryParse(value!);
          if (result == null) {
            return "数字を入力してください";
          } else if (result < -2.0 || result > 2.0) {
            return "-2.0以上2.0以下の値を入力してください";
          } else {
            return null;
          }
        },
      )
    ];
  }
}

class ToGeneratePageButton extends StatelessWidget {
  const ToGeneratePageButton({super.key});
  @override
  Widget build(BuildContext context) {
    return TextButton(
        // Get.toNamedをNavigator.pushNamedに変更
        onPressed: () => Navigator.pushNamed(context, GenerateImagePage.path),
        child: Text(
          "画像を生成する",
          style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
        ));
  }
}
