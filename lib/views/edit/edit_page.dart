import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/presentation/notifier/current_user/current_user_notifier.dart';
import 'package:great_talk/core/route_core.dart';
import 'package:great_talk/provider/view_model/edit/edit_view_model.dart';
import 'package:great_talk/ui_core/toast_ui_core.dart';
import 'package:great_talk/presentation/page/common/forms_screen.dart';
import 'package:great_talk/presentation/page/edit/components/edit_profile_form.dart';
import 'package:great_talk/presentation/page/edit/components/profile_image_widget.dart';
import 'package:great_talk/presentation/page/edit/components/update_button_widget.dart';
import 'package:great_talk/presentation/page/loading_page.dart';
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
        void onImageTap() async {
          final result = await notifier().onImagePickButtonPressed();
          result.when(
            success: (_) {
              ToastUiCore.showSuccessSnackBar(context, '画像の取得が成功しました');
            },
            failure: (msg) {
              ToastUiCore.showFailureSnackBar(context, msg);
            },
          );
        }

        return FormsScreen(
          appBarText: "ユーザー情報を編集",
          children: [
            EditProfileForm(formKey: formKey, editModelData: editModelData),
            const SizedBox(height: 16.0),
            ProfileImageWidget(
              base64Image: editModelData.base64,
              onImageTap: onImageTap,
            ),
            const SizedBox(height: 16.0),
            UpdateButtonWidget(
              onPressed: () async {
                if (formKey.currentState?.validate() != true) return;
                formKey.currentState?.save();
                final result = await notifier().onPositiveButtonPressed();
                result.when(
                  success: (_) {
                    ref.read(currentUserNotifierProvider.notifier).updateUser();
                    RouteCore.back(context);
                    RouteCore.back(context);
                    ToastUiCore.showSuccessSnackBar(
                      context,
                      "プロフィールを更新できました！変更が完全に反映されるまで時間がかかります。",
                    );
                  },
                  failure: (e) {
                    ToastUiCore.showFailureSnackBar(
                      context,
                      "プロフィールを更新できませんでした",
                    );
                  },
                );
              },
            ),
          ],
        );
      },
      loading: () => const LoadingPage(),
      error: (err, stack) => Center(child: Text('エラーが発生しました: $err')),
    );
  }
}
