import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/ints.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/controllers/create_post_controller.dart';
import 'package:great_talk/state/abstract/processing_state.dart';
import 'package:great_talk/views/components/rounded_button.dart';
import 'package:great_talk/views/create_post/components/form_label.dart';
import 'package:great_talk/views/create_post/components/original_form.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends ProcessingState<CreatePostPage> {
  double? _deviceHeight, _deviceWidth;
  // ログとフォームキーをとる
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height; // 高さを設定
    _deviceWidth = MediaQuery.of(context).size.width; // 幅を設定
    return WillPopScope(
      onWillPop: () async {
        if (_formKey.currentState!.validate()) {
          // フォームフィールドの情報を変数に保存
          _formKey.currentState!.save();
        }
        return true; // 画面を閉じる処理を許可
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "投稿を作成",
          ),
        ),
        body: SafeArea(
            child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.05),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  // 水平パディング
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _createPostForm(),
                    _image(),
                    _createPostButton(),
                  ],
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }

  // 入力フォーム関数
  Widget _createPostForm() {
    return SizedBox(
      height: _deviceHeight! * 0.50,
      child: Form(
          key: _formKey,
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

  // title入力をする関数
  List<Widget> _titleTextField() {
    return [
      const FormLabel(
        title: "タイトル",
        helpMsg: titleHelpMsg,
      ),
      Obx(() => OriginalForm(
            initialValue: CreatePostController.to.title.value,
            decoration: const InputDecoration(hintText: "例: 猫GPT"),
            onSaved: CreatePostController.to.setTitle,
            validator: (value) {
              if (value!.length < nGramIndex) {
                return "$nGramIndex文字以上の入力をしてください";
              } else if (value.length > maxTitleLimit) {
                return textLimitMsg(maxTitleLimit, value);
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
      const FormLabel(title: "説明/使い方(AIの一言目)", helpMsg: descriptionHelpMsg),
      Obx(() => OriginalForm(
            initialValue: CreatePostController.to.description.value,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: const InputDecoration(hintText: "例: かわいい猫のAIだにゃん！"),
            onSaved: CreatePostController.to.setDescription,
            validator: (value) {
              if (value!.isEmpty) {
                return "入力をしてください";
              } else if (value.length > maxDescriptionLimit) {
                return textLimitMsg(maxDescriptionLimit, value);
              } else {
                return null;
              }
            },
          ))
    ];
  }

  // systemPrompt入力をする関数
  List<Widget> _systemPromptTextField() {
    return [
      const FormLabel(title: "システムプロンプト", helpMsg: systemPromptHelpMsg),
      Obx(() => OriginalForm(
            initialValue: CreatePostController.to.systemPrompt.value,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration:
                const InputDecoration(hintText: "例: 語尾に必ず「にゃん」をつけて返答して！"),
            onSaved: CreatePostController.to.setSystemPrompt,
            validator: (value) {
              if (value!.isEmpty) {
                return "入力をしてください";
              } else if (value.length > maxSystemPromptLimit) {
                return textLimitMsg(maxSystemPromptLimit, value);
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
      const FormLabel(title: "temperature", helpMsg: temperatureHelpMsg),
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
      const FormLabel(title: "topP", helpMsg: topPHelpMsg),
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
          title: "PresencePenalty", helpMsg: presencePenaltyHelpMsg),
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
          title: "FrequencyPenalty", helpMsg: frequencyPenaltyHelpMsg),
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

  // ログインボタン関数
  Widget _createPostButton() {
    return RoundedButton(
        text: "送信",
        press: _onCreateButtonPressed,
        buttonColor: Theme.of(context).primaryColor,
        textColor: Colors.white);
  }

  Widget _image() {
    final controller = CreatePostController.to;
    return Obx(() => controller.uint8list.value == null
        ? Row(
            children: [
              InkWell(
                onTap: controller.onImagePickButtonPressed,
                child: const Icon(
                  Icons.image,
                  size: 100.0,
                ),
              ),
              const Text("画像を選択")
            ],
          )
        : InkWell(
            onTap: controller.onImagePickButtonPressed,
            child: SizedBox(
                width: 100.0,
                height: 100.0,
                child: Obx(
                  () => Image.memory(controller.uint8list.value!),
                )),
          ));
  }

  void _onCreateButtonPressed() async {
    if (_formKey.currentState!.validate()) {
      // フォームフィールドの情報を変数に保存
      _formKey.currentState!.save();
    }
    await CreatePostController.to.processCreatePost();
  }
}
