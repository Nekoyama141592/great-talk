import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:great_talk/provider/keep_alive/notifier/remote_config/remote_config_provider.dart';
import 'package:great_talk/ui_core/texts.dart';
import 'package:great_talk/views/common/async_screen/async_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class MaintenancePage extends ConsumerWidget {
  const MaintenancePage({super.key});
  static const path = '/-'; // Pathに意味を持たせない
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(remoteConfigNotifierProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AsyncScreen(
          asyncValue: asyncValue,
          data: (state) {
            final isMaintenance = state.maintenanceMode;
            final text =
                isMaintenance ? state.maintenanceMsg : state.forcedUpdateMsg;
            return Align(
              alignment: Alignment.center,
              child: BasicBoldText(text),
            );
          },
        ),
      ),
    );
  }
}
