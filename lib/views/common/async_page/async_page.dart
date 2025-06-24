import 'package:flutter/material.dart';
import 'package:great_talk/views/common/async_page/async_screen/error_screen.dart';
import 'package:great_talk/views/screen/loading_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AsyncPage<T> extends StatelessWidget {
  const AsyncPage({super.key, required this.asyncValue, required this.data});
  final AsyncValue<T> asyncValue;
  final Widget Function(T) data;
  @override
  Widget build(BuildContext context) {
    return asyncValue.when(
      data: data,
      error: (e, s) => Scaffold(body: ErrorScreen(e: e)),
      loading: () => const Scaffold(body: LoadingScreen()),
    );
  }
}
