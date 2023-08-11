import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:great_talk/common/ints.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/extensions/string_extension.dart';
import 'package:great_talk/infrastructure/firestore/firestore_queries.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/model/aws_s3_repository.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/utility/aws_s3_utility.dart';
import 'package:great_talk/utility/file_utility.dart';
import 'package:great_talk/utility/new_content.dart';
import 'package:great_talk/validator/post_validator.dart';
import 'package:great_talk/views/components/rounded_button.dart';
import 'package:great_talk/views/create_post/components/form_label.dart';
import 'package:great_talk/views/create_post/components/original_form.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> with CurrentUserMixin {
  double? _deviceHeight, _deviceWidth;
  // ログとフォームキーをとる
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? title = ""; // titleの変数
  String? systemPrompt = ""; // systemPromptの変数
  String? description = "";
  String? temperature = defaultTemperature.toString();
  String? topP = defaultTopP.toString();
  String? presencePenalty = defaultPresencePenalty.toString();
  String? frequencyPenalty = defaultFrequencyPenalty.toString();

  Uint8List? uint8list;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height; // 高さを設定
    _deviceWidth = MediaQuery.of(context).size.width; // 幅を設定
    return Scaffold(
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
                ..._titleTextField(),
                ..._descriptionTextField(),
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
      OriginalForm(
        decoration: const InputDecoration(hintText: "例: 猫GPT"),
        onSaved: (value) {
          setState(() {
            title = value;
          });
        },
        validator: (value) {
          if (value!.length < nGramIndex) {
            return "$nGramIndex文字以上の入力をしてください";
          } else if (value.length > maxTitleLimit) {
            return "$maxTitleLimit文字までです";
          } else {
            return null;
          }
        },
      )
    ];
  }

  // description入力をする関数
  List<Widget> _descriptionTextField() {
    return [
      const FormLabel(title: "説明/使い方", helpMsg: descriptionHelpMsg),
      OriginalForm(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: const InputDecoration(hintText: "例: かわいい猫のAIです！"),
        onSaved: (value) {
          setState(() {
            description = value;
          });
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "入力をしてください";
          } else if (value.length > maxDescriptionLimit) {
            return "$maxDescriptionLimit文字までです";
          } else {
            return null;
          }
        },
      )
    ];
  }

  // systemPrompt入力をする関数
  List<Widget> _systemPromptTextField() {
    return [
      const FormLabel(title: "システムプロンプト", helpMsg: systemPromptHelpMsg),
      OriginalForm(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: const InputDecoration(hintText: "例: 語尾に必ず「にゃん」をつけて返答して！"),
        onSaved: (value) {
          setState(() {
            systemPrompt = value;
          });
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "入力をしてください";
          } else if (value.length > maxSystemPromptLimit) {
            return "$maxSystemPromptLimit文字までです";
          } else {
            return null;
          }
        },
      )
    ];
  }

  // temperature入力をする関数
  List<Widget> _temperatureNumberField() {
    return [
      const FormLabel(title: "temperature", helpMsg: temperatureHelpMsg),
      OriginalForm(
        initialValue: defaultTemperature.toString(),
        keyboardType: TextInputType.text,
        onSaved: (value) {
          setState(() {
            temperature = value;
          });
        },
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
      )
    ];
  }

  // topP入力をする関数
  List<Widget> _topPNumberField() {
    return [
      const FormLabel(title: "topP", helpMsg: topPHelpMsg),
      OriginalForm(
        initialValue: defaultTopP.toString(),
        keyboardType: TextInputType.text,
        onSaved: (value) {
          setState(() {
            topP = value;
          });
        },
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
      )
    ];
  }

  // presencePenalty入力をする関数
  List<Widget> _presencePenaltyNumberField() {
    return [
      const FormLabel(
          title: "PresencePenalty", helpMsg: presencePenaltyHelpMsg),
      OriginalForm(
        initialValue: defaultPresencePenalty.toString(),
        keyboardType: TextInputType.text,
        onSaved: (value) {
          setState(() {
            presencePenalty = value;
          });
        },
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
      )
    ];
  }

  // topP入力をする関数
  List<Widget> _frequencyPenaltyNumberField() {
    return [
      const FormLabel(
          title: "FrequencyPenalty", helpMsg: frequencyPenaltyHelpMsg),
      OriginalForm(
        initialValue: defaultFrequencyPenalty.toString(),
        keyboardType: TextInputType.text,
        onSaved: (value) {
          setState(() {
            frequencyPenalty = value;
          });
        },
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
      )
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
    return uint8list == null
        ? Row(
            children: [
              InkWell(
                onTap: _onImagePickButtonPressed,
                child: const Icon(
                  Icons.image,
                  size: 100.0,
                ),
              ),
              const Text("画像を選択")
            ],
          )
        : InkWell(
            onTap: _onImagePickButtonPressed,
            child: SizedBox(
              width: 100.0,
              height: 100.0,
              child: Image.memory(uint8list!),
            ),
          );
  }

  void _onCreateButtonPressed() async {
    if (_formKey.currentState!.validate()) {
      // フォームフィールドの情報を変数に保存
      _formKey.currentState!.save();
    }
    if (uint8list == null) {
      await UIHelper.showErrorFlutterToast("アイコンをタップして画像をアップロードしてください");
      return;
    }
    if (PostValidator.isInValidPost(description, systemPrompt, title,
        temperature, topP, presencePenalty, frequencyPenalty)) {
      await UIHelper.showErrorFlutterToast("条件を満たしていないものがあります");
      return;
    }
    if ((temperature!.toDouble() != defaultTemperature) &&
        (topP!.toDouble() != defaultTopP)) {
      await UIHelper.showErrorFlutterToast("temperatureとtopPはどちらか一方しか変更できません");
      return;
    }
    final newFileName = s3FileName();
    final bucketName = AWSS3Utility.postImagesBucketName();
    final repository = AWSS3Repository();
    final result =
        await repository.uploadImage(uint8list!, bucketName, newFileName);
    result.when(
        success: (res) => _createPost(res),
        failure: () {
          UIHelper.showErrorFlutterToast("画像のアップロードが失敗しました");
        });
  }

  void _onImagePickButtonPressed() async {
    final result = await FileUtility.getCompressedImage();
    setState(() {
      uint8list = result;
    });
  }

  Future<void> _createPost(String fileName) async {
    final repository = FirestoreRepository();
    final postId = randomString();
    final postRef = FirestoreQueries.userPostRef(currentUid(), postId);
    final customCompleteText = NewContent.newCustomCompleteText(systemPrompt!,
            temperature!, topP!, presencePenalty!, frequencyPenalty!)
        .toJson()
      ..removeWhere((key, value) => value == null);
    final newPost = NewContent.newPost(
        systemPrompt!.trim(),
        title!.trim(),
        description!.trim(),
        fileName,
        CurrentUserController.to.publicUser.value!,
        postId,
        postRef,
        customCompleteText);
    final result = await repository.createPost(postRef, newPost.toJson());
    result.when(success: (_) {
      Get.back();
      UIHelper.showFlutterToast("投稿が作成できました！");
    }, failure: () {
      UIHelper.showErrorFlutterToast("投稿が作成できませんでした");
    });
  }
}
