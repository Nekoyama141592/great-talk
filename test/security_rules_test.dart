import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';

final securityRules = '''
service cloud.firestore {
  match /databases/{database}/documents {
    match /public/v1/users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
  }
}''';

void main() {
  group('Security Rules Test', () {
    late MockFirebaseAuth auth;
    late FakeFirebaseFirestore firestore;

    setUp(() {
      auth = MockFirebaseAuth();
      firestore = FakeFirebaseFirestore(
        securityRules: securityRules,
        authObject: auth.authForFakeFirestore,
      );
    });

    test('should allow access to own user document', () async {
      final credential = await auth.signInWithCustomToken('some token');
      final uid = credential.user!.uid;
      expect(
        () => firestore.doc('public/v1/users/$uid').set({'name': 'abc'}),
        returnsNormally,
      );
    });

    test('should deny access to other user\'s document', () async {
      await auth.signInWithCustomToken('some token');

      expect(
        () => firestore.doc('public/v1/users/abcdef').set({'name': 'abc'}),
        throwsException,
      );
    });
  });
}