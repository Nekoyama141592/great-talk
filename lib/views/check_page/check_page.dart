import 'package:flutter/material.dart';
import 'package:great_talk/providers/global/auth/stream_auth_provider.dart';
import 'package:great_talk/providers/global/remote_config/remote_config_provider.dart';
import 'package:great_talk/providers/global/terms/terms_notifier.dart';
import 'package:great_talk/views/check_page/components/maintenance_page.dart';
import 'package:great_talk/views/check_page/components/required_update_page.dart';
import 'package:great_talk/views/check_page/components/terms_page.dart';
import 'package:great_talk/views/common/async_screen/async_screen.dart';
import 'package:great_talk/views/loading_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CheckPage extends ConsumerWidget {
  const CheckPage({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStream = ref.watch(streamAuthUidProvider);
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
        return AsyncScreen(
          asyncValue: userStream,
          data: (uid) {
            return uid != null ? child : const LoadingPage();
          },
        );
      },
    );
  }
}
