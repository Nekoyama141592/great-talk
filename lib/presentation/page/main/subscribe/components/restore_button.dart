import 'package:flutter/material.dart';
import 'package:great_talk/presentation/notifier/products/products_view_model.dart';
import 'package:great_talk/presentation/util/toast_ui_util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RestoreButton extends ConsumerWidget {
  const RestoreButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        alignment: Alignment.bottomRight,
        child: TextButton(
          onPressed: () async {
            final result =
                await ref
                    .read(productsViewModelProvider.notifier)
                    .onRestoreButtonPressed();
            result.when(
              success:
                  (_) =>
                      ToastUiUtil.showSuccessSnackBar(context, '購入の検証が成功しました'),
              failure: (msg) => ToastUiUtil.showFailureSnackBar(context, msg),
            );
          },
          child: Text(
            '購入を復元',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).focusColor,
            ),
          ),
        ),
      ),
    );
  }
}
