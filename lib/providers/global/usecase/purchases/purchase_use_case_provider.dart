import 'package:great_talk/providers/repository/api/api_repository_provider.dart';
import 'package:great_talk/use_case/purchase_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'purchase_use_case_provider.g.dart';

@riverpod
PurchaseUseCase purchaseUseCase(Ref ref) =>
    PurchaseUseCase(ref.watch(apiRepositoryProvider));
