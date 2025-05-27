import 'package:great_talk/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_router_notifier.g.dart';

@Riverpod(keepAlive: true)
AppRouter appRouter(Ref ref) => AppRouter();