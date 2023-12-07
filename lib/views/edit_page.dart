import 'package:flutter/material.dart';
import 'package:great_talk/consts/form_consts.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/edit_controller.dart';
import 'package:great_talk/extensions/string_extension.dart';
import 'package:great_talk/states/abstract/forms_state.dart';
import 'package:great_talk/views/common/forms_screen.dart';
import 'package:great_talk/views/create_post/components/form_label.dart';
import 'package:great_talk/views/create_post/components/original_form.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends FormsState<EditProfilePage> {
  @override
  void initState() {
    EditController.to.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height; // 高さを設定
    final controller = EditController.to;
    return FormsScreen(
      onWillPop: onWillPop,
      appBarText: "ユーザー情報を編集",
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
              children: [..._userNameTextField(), ..._bioTextField()],
            ),
          )),
    );
  }

  // userName入力をする関数
  List<Widget> _userNameTextField() {
    return [
      const FormLabel(
        title: "ニックネーム",
        helpMsg: FormConsts.userNameHelpMsg,
      ),
      OriginalForm(
        initialValue: CurrentUserController.to.rxPublicUser.value!.nameValue,
        keyboardType: TextInputType.text,
        onSaved: EditController.to.setUserName,
        validator: (value) {
          if (value!.length < FormConsts.nGramIndex) {
            return "${FormConsts.nGramIndex}文字以上の入力を行なってください";
          } else if (value.length > FormConsts.maxUserNameLimit) {
            return FormConsts.textLimitMsg(FormConsts.maxUserNameLimit, value);
          } else if (value.invalidField) {
            return EditController.to.invalidFieldMsg;
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
        helpMsg: FormConsts.bioHelpMsg,
      ),
      OriginalForm(
        initialValue:
            CurrentUserController.to.rxPublicUser.value!.typedBio().value,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        onSaved: EditController.to.setBio,
        validator: (value) {
          if (value!.isEmpty) {
            return "入力を行なってください";
          } else if (value.length > FormConsts.maxBioLimit) {
            return FormConsts.textLimitMsg(FormConsts.maxBioLimit, value);
          } else {
            return null;
          }
        },
      )
    ];
  }
}
