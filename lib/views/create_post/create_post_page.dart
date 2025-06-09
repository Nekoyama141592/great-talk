import 'dart:convert';
import 'dart:typed_data';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:great_talk/consts/form_consts.dart';
import 'package:great_talk/core/route_core.dart';
import 'package:great_talk/extension/string_extension.dart';
import 'package:great_talk/providers/view_model/create_post/create_post_view_model.dart';
import 'package:great_talk/ui_core/form_ui_core.dart';
import 'package:great_talk/ui_core/toast_ui_core.dart';
import 'package:great_talk/views/common/forms_screen.dart';
import 'package:great_talk/views/components/rounded_button.dart';
import 'package:great_talk/views/create_post/components/form_label.dart';
import 'package:great_talk/views/create_post/components/original_form.dart';
import 'package:great_talk/views/generate_image/generate_image_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
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
    final state = stateAsync.value;

    // 画像表示/選択ウィジェット
    Widget image() {
      final pickedImageBase64 = state?.pickedImage;
      final Uint8List? imageBytes =
          pickedImageBase64 != null ? base64Decode(pickedImageBase64) : null;

      return imageBytes == null
          ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: viewModel.onImagePickButtonPressed,
                child: const Icon(Icons.image, size: 100.0),
              ),
              const SizedBox(width: 16),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(FormConsts.imageLabel), ToGeneratePageButton()],
              ),
            ],
          )
          : InkWell(
            onTap: viewModel.onImagePickButtonPressed,
            child: SizedBox(
              width: 100.0,
              height: 100.0,
              child: Image.memory(imageBytes),
            ),
          );
    }

    // 送信ボタン押下時の処理
    void onPositiveButtonPressed() async {
      final form = _formKey.currentState;
      if (form == null || !form.validate()) {
        return;
      }
      form.save();
      final result =
          await ref
              .read(createPostViewModelProvider.notifier)
              .onPositiveButtonPressed();
      result.when(
        success: (_) {
          ToastUiCore.showFailureSnackBar(context, '投稿の作成に成功しました');
          RouteCore.back(context);
        },
        failure: (msg) {
          ToastUiCore.showFailureSnackBar(context, msg);
        },
      );
    }

    // 送信ボタンウィジェット
    Widget positiveButton(bool isLoading) {
      return RoundedButton(
        text: "送信",
        // ローディング中はnullを渡し、ボタンを非活性化
        press: isLoading ? null : onPositiveButtonPressed,
        buttonColor: Theme.of(context).primaryColor,
        textColor: Colors.white,
      );
    }

    List<Widget> systemPromptTextField() {
      return [
        const FormLabel(
          title: "システムプロンプト",
          helpMsg: FormConsts.systemPromptHelpMsg,
        ),
        OriginalForm(
          initialValue: state?.systemPrompt ?? FormConsts.defaultSystemPrompt,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          onSaved: viewModel.setSystemPrompt,
          validator: (value) {
            if (value!.isEmpty) {
              return "入力をしてください";
            } else if (value.length > FormConsts.maxSystemPromptLimit) {
              return FormConsts.textLimitMsg(
                FormConsts.maxSystemPromptLimit,
                value,
              );
            } else if (value == FormConsts.defaultSystemPrompt) {
              return "初期値から変更してください。";
            } else {
              return null;
            }
          },
        ),
      ];
    }

    List<Widget> descriptionTextField() {
      return [
        const FormLabel(
          title: "説明/使い方(AIの一言目)",
          helpMsg: FormConsts.descriptionHelpMsg,
        ),
        OriginalForm(
          initialValue: state?.description ?? '',
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: const InputDecoration(
            hintText: FormConsts.hintDescription,
          ),
          onSaved: viewModel.setDescription,
          validator: (value) {
            if (value!.isEmpty) {
              return "入力をしてください";
            } else if (value.length > FormConsts.maxDescriptionLimit) {
              return FormConsts.textLimitMsg(
                FormConsts.maxDescriptionLimit,
                value,
              );
            } else {
              return null;
            }
          },
        ),
      ];
    }

    List<Widget> titleTextField() {
      return [
        const FormLabel(title: "タイトル", helpMsg: FormConsts.titleHelpMsg),
        OriginalForm(
          initialValue: state?.title ?? '',
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
        ),
      ];
    }

    // 投稿フォーム全体
    Widget createPostForm() {
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
                ...systemPromptTextField(),
                ...descriptionTextField(),
                ...titleTextField(),
              ],
            ),
          ),
        ),
      );
    }

    return FormsScreen(
      appBarText: "投稿を作成",
      children: [
        createPostForm(),
        image(),
        positiveButton(stateAsync.isLoading),
      ],
    );
  }
}

class ToGeneratePageButton extends StatelessWidget {
  const ToGeneratePageButton({super.key});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => RouteCore.pushPath(context, GenerateImagePage.path),
      child: Text(
        "画像を生成する",
        style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
      ),
    );
  }
}
