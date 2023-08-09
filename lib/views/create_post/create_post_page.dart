import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/infrastructure/firestore/firestore_queries.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/model/aws_s3_repository.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/utility/file_utility.dart';
import 'package:great_talk/utility/new_content.dart';
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

  String? title; // titleの変数
  String? systemPrompt; // systemPromptの変数
  String? description;
  String? temperature;
  String? topP;
  String? presencePenalty;
  String? frequencyPenalty;

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
      const FormLabel(title: "タイトル"),
      OriginalForm(
        decoration: const InputDecoration(hintText: "例: 猫GPT"),
        onSaved: (value) {
          setState(() {
            title = value;
          });
        },
        validator: (value) => value!.isEmpty ? "入力を行ってください" : null,
      )
    ];
  }

  // description入力をする関数
  List<Widget> _descriptionTextField() {
    return [
      const FormLabel(title: "説明/使い方"),
      OriginalForm(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: const InputDecoration(hintText: "例: 語尾に「にゃん」をつけて話してくれます！"),
        onSaved: (value) {
          setState(() {
            title = value;
          });
        },
        validator: (value) => value!.isEmpty ? "入力を行ってください" : null,
      )
    ];
  }

  // systemPrompt入力をする関数
  List<Widget> _systemPromptTextField() {
    return [
      const FormLabel(title: "システムプロンプト"),
      OriginalForm(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: const InputDecoration(hintText: "例: 語尾に必ず「にゃん」をつけて返答して！"),
        onSaved: (value) {
          setState(() {
            systemPrompt = value;
          });
        },
        validator: (value) => value!.isEmpty ? "入力を行ってください" : null,
      )
    ];
  }

  // temperature入力をする関数
  List<Widget> _temperatureNumberField() {
    return [
      const FormLabel(title: "temperature"),
      OriginalForm(
        initialValue: defaultTemperature.toString(),
        keyboardType: TextInputType.number,
        onSaved: (value) {
          setState(() {
            temperature = value;
          });
        },
        validator: (value) =>
            double.tryParse(value!) == null ? "数字を入力してください" : null,
      )
    ];
  }

  // topP入力をする関数
  List<Widget> _topPNumberField() {
    return [
      const FormLabel(title: "topP"),
      OriginalForm(
        initialValue: defaultTopP.toString(),
        keyboardType: TextInputType.number,
        onSaved: (value) {
          setState(() {
            topP = value;
          });
        },
        validator: (value) =>
            double.tryParse(value!) == null ? "数字を入力してください" : null,
      )
    ];
  }

  // presencePenalty入力をする関数
  List<Widget> _presencePenaltyNumberField() {
    return [
      const FormLabel(title: "PresencePenalty"),
      OriginalForm(
        initialValue: defaultPresencePenalty.toString(),
        keyboardType: TextInputType.number,
        onSaved: (value) {
          setState(() {
            presencePenalty = value;
          });
        },
        validator: (value) =>
            double.tryParse(value!) == null ? "数字を入力してください" : null,
      )
    ];
  }

  // topP入力をする関数
  List<Widget> _frequencyPenaltyNumberField() {
    return [
      const FormLabel(title: "FrequencyPenalty"),
      OriginalForm(
        initialValue: defaultFrequencyPenalty.toString(),
        keyboardType: TextInputType.number,
        onSaved: (value) {
          setState(() {
            topP = value;
          });
        },
        validator: (value) =>
            double.tryParse(value!) == null ? "数字を入力してください" : null,
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

  // ユーザーログイン関数
  void _onCreateButtonPressed() async {
    if (_formKey.currentState!.validate()) {
      // フォームフィールドの情報を変数に保存
      _formKey.currentState!.save();
    }
    if (uint8list == null) {
      await UIHelper.showErrorFlutterToast("アイコンをタップして画像をアップロードしてください");
    }
    if (title == null ||
        systemPrompt == null ||
        title!.isEmpty ||
        systemPrompt!.isEmpty) {
      return;
    }
    final newFileName = s3FileName();
    final repository = AWSS3Repository();
    final result = await repository.uploadImage(uint8list!, newFileName);
    result.when(
        success: (_) => _createPost(),
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

  Future<void> _createPost() async {
    final repository = FirestoreRepository();
    final postId = randomString();
    final postRef = FirestoreQueries.userPostRef(currentUid(), postId);
    final newPost = NewContent.newPost(systemPrompt!, title!,
        CurrentUserController.to.publicUser.value!, postId, postRef);
    final result = await repository.createPost(postRef, newPost.toJson());
    result.when(success: (_) {
      UIHelper.showFlutterToast("投稿が作成できました！");
    }, failure: () {
      UIHelper.showErrorFlutterToast("投稿が作成できませんでした");
    });
  }
}
