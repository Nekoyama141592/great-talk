import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:great_talk/consts/form_consts.dart';
import 'package:great_talk/extensions/string_extension.dart';
import 'package:great_talk/model/view_model_state/edit/edit_state.dart';
import 'package:great_talk/providers/view_model/edit/edit_view_model.dart';
import 'package:great_talk/ui_core/form_ui_core.dart';
import 'package:great_talk/views/common/forms_screen.dart';
import 'package:great_talk/views/components/circle_image/components/s3_image.dart';
import 'package:great_talk/views/create_post/components/form_label.dart';
import 'package:great_talk/views/create_post/components/original_form.dart';
import 'package:great_talk/views/loading_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});
  static const path = "/editProfile";

  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  final formKey = GlobalKey<FormState>();
  late double deviceHeight;

  @override
  void initState() {
    super.initState();
    // initState内で直接notifierを呼び出す場合は一手間必要
    Future.microtask(() => ref.read(editViewModelProvider.notifier).init());
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    final editState = ref.watch(editViewModelProvider);
    final notifier = ref.read(editViewModelProvider.notifier);

    return editState.when(
      data:
          (data) => FormsScreen(
            appBarText: "ユーザー情報を編集",
            children: [
              _editForm(data, notifier),
              _image(data, notifier),
              _positiveButton(data, notifier),
            ],
          ),
      loading: () => const LoadingPage(),
      error: (err, stack) => Center(child: Text('エラーが発生しました: $err')),
    );
  }

  Widget _editForm(EditState data, EditViewModel notifier) {
    return SizedBox(
      height: deviceHeight * 0.50,
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ..._userNameTextField(data, notifier),
              ..._bioTextField(data, notifier),
            ],
          ),
        ),
      ),
    );
  }

  Widget _image(EditState data, EditViewModel notifier) {
    final base64 = data.base64;
    final uint8list = base64 != null ? base64Decode(base64) : null;
    return uint8list != null
        ? InkWell(
          onTap: notifier.onImagePickButtonPressed,
          child: S3Image(uint8list: uint8list, height: 40.0, width: 40.0),
        )
        : const SizedBox.shrink();
  }

  Widget _positiveButton(EditState data, EditViewModel notifier) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          notifier.onPositiveButtonPressed();
        }
      },
      child: const Text("更新する"),
    );
  }

  List<Widget> _userNameTextField(EditState data, EditViewModel notifier) {
    return [
      const FormLabel(title: "ニックネーム", helpMsg: FormConsts.userNameHelpMsg),
      OriginalForm(
        initialValue: data.userName,
        keyboardType: TextInputType.text,
        onSaved: notifier.setUserName,
        validator: (value) {
          if (value == null || value.length < FormConsts.nGramIndex) {
            return "${FormConsts.nGramIndex}文字以上の入力を行なってください";
          } else if (value.length > FormConsts.maxUserNameLimit) {
            return FormConsts.textLimitMsg(FormConsts.maxUserNameLimit, value);
          } else if (value.invalidField) {
            return FormUiCore.invalidFieldMsg;
          }
          return null;
        },
      ),
    ];
  }

  List<Widget> _bioTextField(EditState data, EditViewModel notifier) {
    return [
      const FormLabel(title: "紹介文", helpMsg: FormConsts.bioHelpMsg),
      OriginalForm(
        initialValue: data.bio,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        onSaved: notifier.setBio,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "入力を行なってください";
          } else if (value.length > FormConsts.maxBioLimit) {
            return FormConsts.textLimitMsg(FormConsts.maxBioLimit, value);
          }
          return null;
        },
      ),
    ];
  }
}
