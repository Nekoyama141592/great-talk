import 'package:flutter/material.dart';
import 'package:great_talk/providers/stream/products/products_view_model.dart';
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
          onPressed:
              ref
                  .read(productsViewModelProvider.notifier)
                  .onRestoreButtonPressed,
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
