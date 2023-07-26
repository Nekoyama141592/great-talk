import 'package:flutter/foundation.dart';
import 'package:great_talk/consts/debug_constants.dart';
import 'package:great_talk/infrastructure/firestore/firestore_client.dart';
import 'package:great_talk/infrastructure/firestore/mocks/mock_firestore_client.dart';
import 'package:great_talk/repository/result.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class FirestoreRepository {
  final client = isUseMockData ? MockFirestoreClient() : FirestoreClient();
  FutureResult<List<QDoc>> getUsers() async {
    try {
      final res = await client.getUsers();
      final users = res.docs;
      return Result.success(users);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }
}
