import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/consts/form_consts.dart';
import 'package:great_talk/extension/string_extension.dart';
import 'package:great_talk/providers/global/current_user/current_user_notifier.dart';
import 'package:great_talk/core/router_core.dart';
import 'package:great_talk/providers/view_model/edit/edit_view_model.dart';
import 'package:great_talk/ui_core/form_ui_core.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
import 'package:great_talk/views/common/forms_screen.dart';
import 'package:great_talk/views/components/circle_image/components/s3_image.dart';
import 'package:great_talk/views/components/rounded_button.dart';
import 'package:great_talk/views/create_post/components/form_label.dart';
import 'package:great_talk/views/create_post/components/original_form.dart';
import 'package:great_talk/views/loading_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class EditProfilePage extends HookConsumerWidget {
  const EditProfilePage({super.key});
  static const path = "/editProfile";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // formKey を useMemoized を使って build メソッド内で初期化し、再ビルド間で状態を保持
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final editStateAsync = ref.watch(editViewModelProvider);
    EditViewModel notifier() => ref.read(editViewModelProvider.notifier);

    return editStateAsync.when(
      data: (editModelData) {
        List<Widget> userNameTextField() {
          return [
            const FormLabel(title: "ニックネーム", helpMsg: FormConsts.userNameHelpMsg),
            OriginalForm(
              initialValue: editModelData.userName,
              keyboardType: TextInputType.text,
              onSaved: notifier().setUserName,
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

        List<Widget> bioTextField() {
          return [
            const FormLabel(title: "紹介文", helpMsg: FormConsts.bioHelpMsg),
            OriginalForm(
              initialValue: editModelData.bio,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onSaved: notifier().setBio,
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

        Widget editForm() {
          return SizedBox(
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16.0,),
                    ...userNameTextField(),
                    const SizedBox(height: 16.0,),
                    ...bioTextField(),
                  ],
                ),
              ),
            ),
          );
        }
        void onImageTap() async {
          final result = await notifier().onImagePickButtonPressed();
          result.when(success: (_) {
            UIHelper.showSuccessSnackBar(context, '画像の取得が成功しました');
          }, failure: (msg) {
            UIHelper.showFailureSnackBar(context, msg);
          });
        }

        Widget imageWidget() {
          final base64 = editModelData.base64;
          final uint8list = base64 != null ? base64Decode(base64) : null;
          return uint8list != null
              ? InkWell(
                  onTap: onImageTap,
                  child: S3Image(uint8list: uint8list, height: 128, width: 128),
                )
              : InkWell(
                onTap: onImageTap,
                child: const Icon(Icons.image)
              );
        }

        Widget positiveButton() {
          return RoundedButton(
            press: () async {
              if (formKey.currentState?.validate() != true) return;
              formKey.currentState?.save();
              final result = await notifier().onPositiveButtonPressed();
              result.when(
                success: (_) {
                  ref.read(currentUserNotifierProvider.notifier).updateUser();
                  RouterCore.back(context);
                  RouterCore.back(context);
                  UIHelper.showSuccessSnackBar(context, "プロフィールを更新できました！変更が完全に反映されるまで時間がかかります。");
                },
                failure: (e) {
                  UIHelper.showFailureSnackBar(context, "プロフィールを更新できませんでした");
                },
              );
            },
            text: "更新する",
          );
        }

        return FormsScreen(
          appBarText: "ユーザー情報を編集",
          children: [
            editForm(),
            const SizedBox(height: 16.0,),
            imageWidget(),
            const SizedBox(height: 16.0,),
            positiveButton(),
          ],
        );
      },
      loading: () => const LoadingPage(),
      error: (err, stack) => Center(child: Text('エラーが発生しました: $err')),
    );
  }
}