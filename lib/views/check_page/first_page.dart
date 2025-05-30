import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:great_talk/providers/global/remote_config/remote_config_provider.dart';
import 'package:great_talk/providers/global/terms/terms_notifier.dart';
import 'package:great_talk/views/check_page/components/maintenance_page.dart';
import 'package:great_talk/views/check_page/components/required_update_page.dart';
import 'package:great_talk/views/check_page/components/terms_page.dart';
import 'package:great_talk/views/common/async_screen/async_screen.dart';
import 'package:great_talk/views/main/my_home_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class FirstPage extends ConsumerWidget {
  const FirstPage({super.key});
  static const path = '/';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final remoteConfigState = ref.watch(remoteConfigNotifierProvider);
    final localState = ref.watch(termsNotifierProvider);
    return AsyncScreen(
      asyncValue: remoteConfigState,
      data: (data) {
        if (data.maintenanceMode) {
          return MaintenancePage(maintenanceMsg: data.maintenanceMsg);
        }
        if (data.needsUpdate) {
          return RequiredUpdatePage(forcedUpdateMsg: data.forcedUpdateMsg);
        }
        if (!localState) {
          return const TermsPage();
        }
        return MyHomePage();
      },
    );
  }
}
