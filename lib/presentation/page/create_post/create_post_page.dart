import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart'; // flutter_hooksをインポート
import 'package:great_talk/core/util/route_util.dart';
import 'package:great_talk/core/provider/keep_alive/notifier/purchases/purchases_notifier.dart';
import 'package:great_talk/core/provider/view_model/create_post/create_post_view_model.dart';
import 'package:great_talk/presentation/util/toast_ui_util.dart';
import 'package:great_talk/presentation/page/common/forms_screen.dart';
import 'package:great_talk/presentation/page/create_post/components/create_post_form.dart';
import 'package:great_talk/presentation/page/create_post/components/image_picker_widget.dart';
import 'package:great_talk/presentation/page/create_post/components/submit_button_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class CreatePostPage extends HookConsumerWidget {
  const CreatePostPage({super.key});
  static const path = "/createPost";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final deviceHeight = MediaQuery.of(context).size.height;
    final stateAsync = ref.watch(createPostViewModelProvider);
    final purchaseState = ref.watch(purchasesNotifierProvider).value;
    final state = stateAsync.value;

    // 送信ボタン押下時の処理
    void onPositiveButtonPressed() async {
      // hookで生成したformKeyを使用
      final form = formKey.currentState;
      if (form == null || !form.validate()) {
        return;
      }
      form.save();
      final result =
          await ref
              .read(createPostViewModelProvider.notifier)
              .onPositiveButtonPressed();
      result.when(
        success: (_) {
          ToastUiUtil.showSuccessSnackBar(context, '投稿の作成に成功しました');
          RouteUtil.back(context);
        },
        failure: (msg) {
          ToastUiUtil.showFailureSnackBar(context, msg);
        },
      );
    }

    return FormsScreen(
      appBarText: "投稿を作成",
      children: [
        CreatePostForm(
          formKey: formKey, // hookで生成したformKeyを渡す
          state: state,
          deviceHeight: deviceHeight,
        ),
        ImagePickerWidget(
          state: state,
          isPremiumSubscribing: purchaseState?.isPremiumSubscribing() ?? false,
        ),
        SubmitButtonWidget(
          isLoading: stateAsync.isLoading,
          onPressed: onPositiveButtonPressed,
        ),
      ],
    );
  }
}
