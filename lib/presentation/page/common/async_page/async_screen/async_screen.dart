import 'package:flutter/material.dart';
import 'package:great_talk/presentation/page/common/async_page/async_screen/error_screen.dart';
import 'package:great_talk/presentation/page/screen/loading_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AsyncScreen<T> extends StatelessWidget {
  const AsyncScreen({super.key, required this.asyncValue, required this.data});
  final AsyncValue<T> asyncValue;
  final Widget Function(T) data;
  @override
  Widget build(BuildContext context) {
    return asyncValue.when(
      data: data,
      error: (e, s) => ErrorScreen(e: e),
      loading: () => const LoadingScreen(),
    );
  }
}
