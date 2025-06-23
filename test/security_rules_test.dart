import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:test/test.dart';

// https://firebase.google.com/docs/rules/rules-and-auth#leverage_user_information_in_rules
final authUidDescription = '''
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
  }
}''';

void main() {
  group('Security Rules Test', () {
    test('should allow access to own user document', () async {
      final auth = MockFirebaseAuth();
      final firestore = FakeFirebaseFirestore(
        securityRules: authUidDescription,
        authObject: auth.authForFakeFirestore,
      );
      await auth.signInWithCustomToken('some token');
      final uid = auth.currentUser!.uid;
      expect(
        () => firestore.doc('users/$uid').set({'name': 'abc'}),
        returnsNormally,
      );
    });

    test('should deny access to other user\'s document', () async {
      final auth = MockFirebaseAuth();
      final firestore = FakeFirebaseFirestore(
        securityRules: authUidDescription,
        authObject: auth.authForFakeFirestore,
      );
      await auth.signInWithCustomToken('some token');
      expect(
        () => firestore.doc('users/abcdef').set({'name': 'abc'}),
        throwsException,
      );
    });
  });
}