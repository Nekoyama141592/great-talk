import 'dart:typed_data';

import 'package:flutter/material.dart';
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
  Uint8List? uint8list;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height; // 高さを設定
    _deviceWidth = MediaQuery.of(context).size.width; // 幅を設定
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.05),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              // 水平パディング
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _titleWidget(),
                _createPostForm(),
                _image(),
                _createPostButton(),
              ],
            ),
          ),
        ),
      )),
    );
  }

  // タイトル関数
  Widget _titleWidget() {
    return const Text(
      "投稿を作成",
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
    );
  }

  // 入力フォーム関数
  Widget _createPostForm() {
    return SizedBox(
      height: _deviceHeight! * 0.30,
      child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _titleTextField(),
              _systemPromptTextField(),
            ],
          )),
    );
  }

  // title入力をする関数
  Widget _titleTextField() {
    return TextFormField(
      decoration: const InputDecoration(hintText: "タイトル"),
      onSaved: (value) {
        setState(() {
          title = value;
        });
      },
      validator: (value) => value!.isEmpty ? "入力を行ってください" : null,
    );
  }

  // systemPrompt入力をする関数
  Widget _systemPromptTextField() {
    return TextFormField(
      obscureText: true, // パスワードを隠す
      decoration: const InputDecoration(hintText: "システムプロンプト"),
      onSaved: (value) {
        setState(() {
          systemPrompt = value;
        });
      },
      validator: (value) => value!.isEmpty ? "入力を行ってください" : null,
    );
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
        ? InkWell(
            onTap: _onImagePickButtonPressed,
            child: const Icon(
              Icons.image,
              size: 100.0,
            ),
          )
        : SizedBox(
            width: 100.0,
            height: 100.0,
            child: Image.memory(uint8list!),
          );
  }

  // ユーザーログイン関数
  void _onCreateButtonPressed() async {
    if (_formKey.currentState!.validate()) {
      // フォームフィールドの情報を変数に保存
      _formKey.currentState!.save();
    }
    if (title == null ||
        systemPrompt == null ||
        title!.isEmpty ||
        systemPrompt!.isEmpty ||
        uint8list == null) {
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
