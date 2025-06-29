import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:great_talk/core/provider/keep_alive/notifier/terms/terms_notifier.dart';
import 'package:great_talk/core/provider/keep_alive/stream/auth/stream_auth_provider.dart';
import 'package:great_talk/presentation/page/auth/login_page.dart';
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
    final authUser = ref.watch(authProvider);
    if (!isAgreedToTerms) {
      return Scaffold(body: const TermsScreen());
    }
    if (authUser == null) {
      return LoginPage();
    }
    if (!authUser.emailVerified) {

    }
    return MyHomePage();
  }
}
