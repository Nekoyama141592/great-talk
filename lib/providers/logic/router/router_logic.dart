import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'router_logic.g.dart';

@riverpod
StackRouter router(Ref ref, BuildContext context) => context.router;
