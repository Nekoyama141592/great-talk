import 'package:great_talk/repository/database_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:great_talk/providers/global/infrastructure/firebase_firestore/firebase_firestore_provider.dart';

part 'database_repository_provider.g.dart';

@riverpod
DatabaseRepository databaseRepository(Ref ref) =>
    DatabaseRepository(instance: ref.read(firebaseFirestoreProvider));
