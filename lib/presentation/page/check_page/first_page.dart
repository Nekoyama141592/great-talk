import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:great_talk/core/provider/keep_alive/notifier/terms/terms_notifier.dart';
import 'package:great_talk/presentation/page/check_page/components/terms_screen.dart';
import 'package:great_talk/presentation/page/main/my_home_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class FirstPage extends ConsumerWidget {
  const FirstPage({super.key});
  static const path = '/';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAgreedToTerms = ref.watch(termsNotifierProvider);
    return Scaffold(body: isAgreedToTerms ? MyHomePage() : const TermsScreen());
  }
}
