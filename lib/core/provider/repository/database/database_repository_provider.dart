import 'package:great_talk/infrastructure/repository/database_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:great_talk/core/provider/keep_alive/infrastructure/firebase/firebase_firestore/firebase_firestore_provider.dart';

part 'database_repository_provider.g.dart';

@riverpod
DatabaseRepository databaseRepository(Ref ref) =>
    DatabaseRepository(instance: ref.read(firebaseFirestoreProvider));
