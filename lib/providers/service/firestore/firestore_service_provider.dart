import 'package:great_talk/providers/client/firebase_firestore/firebase_firestore_provider.dart';
import 'package:great_talk/service/firestore_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'firestore_service_provider.g.dart';

@riverpod
FirestoreService firestoreService(Ref ref) =>
    FirestoreService(ref.watch(firebaseFirestoreProvider));
