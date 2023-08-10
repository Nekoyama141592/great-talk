import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/ints.dart';
import 'package:great_talk/common/maps.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/model/aws_s3_repository.dart';
import 'package:great_talk/model/user_update_log/user_update_log.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/utility/aws_s3_utility.dart';
import 'package:great_talk/utility/file_utility.dart';
import 'package:great_talk/views/components/rounded_button.dart';
import 'package:great_talk/views/create_post/components/form_label.dart';
import 'package:great_talk/views/create_post/components/original_form.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<EditProfilePage>
    with CurrentUserMixin {
  double? _deviceHeight, _deviceWidth;
  // ログとフォームキーをとる
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? userName;
  String? bio;

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
              children: [..._userNameTextField(), ..._bioTextField()],
            ),
          )),
    );
  }

  // userName入力をする関数
  List<Widget> _userNameTextField() {
    return [
      const FormLabel(
        title: "ユーザー名",
        helpMsg: userNameHelpMsg,
      ),
      OriginalForm(
        initialValue:
            CurrentUserController.to.publicUser.value!.typedUserName().value,
        decoration: const InputDecoration(hintText: "例: M.LO"),
        onSaved: (value) {
          setState(() {
            userName = value;
          });
        },
        validator: (value) {
          if (value!.length < nGramIndex) {
            return "$nGramIndex文字以上の入力をしてください";
          } else if (value.length > maxUserNameLimit) {
            return "$maxUserNameLimit文字までです";
          } else {
            return null;
          }
        },
      )
    ];
  }

  // description入力をする関数
  List<Widget> _bioTextField() {
    return [
      const FormLabel(
        title: "紹介文",
        helpMsg: bioHelpMsg,
      ),
      OriginalForm(
        initialValue:
            CurrentUserController.to.publicUser.value!.typedBio().value,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        onSaved: (value) {
          setState(() {
            bio = value;
          });
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "入力をしてください";
          } else if (value.length > maxBioLimit) {
            return "$maxBioLimit文字までです";
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
      await UIHelper.showErrorFlutterToast("アイコンをタップしてプロフィール画像をアップロードしてください");
    }
    if (userName == null || bio == null || userName!.isEmpty || bio!.isEmpty) {
      return;
    }
    final newFileName = s3FileName();
    final repository = AWSS3Repository();
    final bucketName = AWSS3Utility.userImagesBucketName();
    final result =
        await repository.uploadImage(uint8list!, bucketName, newFileName);
    result.when(
        success: (res) => _createUserUpdateLog(res),
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

  Future<void> _createUserUpdateLog(String fileName) async {
    final repository = FirestoreRepository();
    final newUpdateLog = UserUpdateLog(
        logCreatedAt: Timestamp.now(),
        searchToken: returnSearchToken(userName!),
        stringBio: bio!,
        stringUserName: userName!,
        uid: currentUid(),
        userImageFileName: fileName,
        userRef: CurrentUserController.to.publicUser.value!.ref);
    final result = await repository.createUserUpdateLog(
        currentUid(), newUpdateLog.toJson());
    result.when(success: (_) {
      CurrentUserController.to.updateUser(userName!, bio!);
      Get.back();
      UIHelper.showFlutterToast("プロフィールを更新できました！");
    }, failure: () {
      UIHelper.showErrorFlutterToast("プロフィールを更新できませんでした");
    });
  }
}
