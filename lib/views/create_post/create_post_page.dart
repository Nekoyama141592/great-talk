import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/consts/form_consts.dart';
import 'package:great_talk/controllers/create_post_controller.dart';
import 'package:great_talk/extensions/string_extension.dart';
import 'package:great_talk/states/abstract/forms_state/forms_state.dart';
import 'package:great_talk/views/common/forms_screen.dart';
import 'package:great_talk/views/create_post/components/form_label.dart';
import 'package:great_talk/views/create_post/components/original_form.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);
  static const path = "/createPost";
  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends FormsState<CreatePostPage> {
  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height; // 高さを設定
    final controller = CreatePostController.to;
    return FormsScreen(
      canPop: canPop,
      appBarText: "投稿を作成",
      children: [
        _createPostForm(),
        image(controller),
        positiveButton(controller)
      ],
    );
  }

  // 入力フォーム関数
  Widget _createPostForm() {
    return SizedBox(
      height: deviceHeight! * 0.50,
      child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ..._systemPromptTextField(),
                ..._descriptionTextField(),
                ..._titleTextField(),
                ..._temperatureNumberField(),
                ..._topPNumberField(),
                ..._presencePenaltyNumberField(),
                ..._frequencyPenaltyNumberField()
              ],
            ),
          )),
    );
  }

  // systemPrompt入力をする関数
  List<Widget> _systemPromptTextField() {
    return [
      const FormLabel(
          title: "システムプロンプト", helpMsg: FormConsts.systemPromptHelpMsg),
      Obx(() => OriginalForm(
            initialValue: CreatePostController.to.systemPrompt.value,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            onSaved: CreatePostController.to.setSystemPrompt,
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
          ))
    ];
  }

  // description入力をする関数
  List<Widget> _descriptionTextField() {
    return [
      const FormLabel(
          title: "説明/使い方(AIの一言目)", helpMsg: FormConsts.descriptionHelpMsg),
      Obx(() => OriginalForm(
            initialValue: CreatePostController.to.description.value,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration:
                const InputDecoration(hintText: FormConsts.hintDescription),
            onSaved: CreatePostController.to.setDescription,
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
          ))
    ];
  }

  // title入力をする関数
  List<Widget> _titleTextField() {
    return [
      const FormLabel(
        title: "タイトル",
        helpMsg: FormConsts.titleHelpMsg,
      ),
      Obx(() => OriginalForm(
            initialValue: CreatePostController.to.title.value,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(hintText: FormConsts.hintTitle),
            onSaved: CreatePostController.to.setTitle,
            validator: (value) {
              if (value!.length < FormConsts.nGramIndex) {
                return "${FormConsts.nGramIndex}文字以上の入力をしてください";
              } else if (value.length > FormConsts.maxTitleLimit) {
                return FormConsts.textLimitMsg(FormConsts.maxTitleLimit, value);
              } else if (value.invalidField) {
                return CreatePostController.to.invalidFieldMsg;
              } else {
                return null;
              }
            },
          ))
    ];
  }

  // temperature入力をする関数
  List<Widget> _temperatureNumberField() {
    return [
      const FormLabel(
          title: "temperature", helpMsg: FormConsts.temperatureHelpMsg),
      Obx(() => OriginalForm(
            initialValue: CreatePostController.to.temperature.value,
            keyboardType: TextInputType.text,
            onSaved: CreatePostController.to.setTemperature,
            validator: (value) {
              final result = double.tryParse(value!);
              if (result == null) {
                return "数字を入力してください";
              } else if (result < 0.0 && result > 2.0) {
                return "0.0以上2.0以下の値が必要がです";
              } else {
                return null;
              }
            },
          ))
    ];
  }

  // topP入力をする関数
  List<Widget> _topPNumberField() {
    return [
      const FormLabel(title: "topP", helpMsg: FormConsts.topPHelpMsg),
      Obx(() => OriginalForm(
            initialValue: CreatePostController.to.topP.value,
            keyboardType: TextInputType.text,
            onSaved: CreatePostController.to.setTopP,
            validator: (value) {
              final result = double.tryParse(value!);
              if (result == null) {
                return "数字を入力してください";
              } else if (result < 0.0 && result > 1.0) {
                return "0.0以上1.0以下の値が必要がです";
              } else {
                return null;
              }
            },
          ))
    ];
  }

  // presencePenalty入力をする関数
  List<Widget> _presencePenaltyNumberField() {
    return [
      const FormLabel(
          title: "PresencePenalty", helpMsg: FormConsts.presencePenaltyHelpMsg),
      Obx(() => OriginalForm(
            initialValue: CreatePostController.to.presencePenalty.value,
            keyboardType: TextInputType.text,
            onSaved: CreatePostController.to.setPresencePenalty,
            validator: (value) {
              final result = double.tryParse(value!);
              if (result == null) {
                return "数字を入力してください";
              } else if (result < -2.0 && result > 2.0) {
                return "-2.0以上2.0以下の値が必要がです";
              } else {
                return null;
              }
            },
          ))
    ];
  }

  // topP入力をする関数
  List<Widget> _frequencyPenaltyNumberField() {
    return [
      const FormLabel(
          title: "FrequencyPenalty",
          helpMsg: FormConsts.frequencyPenaltyHelpMsg),
      Obx(() => OriginalForm(
            initialValue: CreatePostController.to.frequencyPenalty.value,
            keyboardType: TextInputType.text,
            onSaved: CreatePostController.to.setFrequencyPenalty,
            validator: (value) {
              final result = double.tryParse(value!);
              if (result == null) {
                return "数字を入力してください";
              } else if (result < -2.0 && result > 2.0) {
                return "-2.0以上2.0以下の値が必要がです";
              } else {
                return null;
              }
            },
          ))
    ];
  }
}
