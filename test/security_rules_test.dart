import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';

final securityRules = '''
service cloud.firestore {
  match /databases/{database}/documents {
    match /public/v1/users/{uid} {
      allow read: if request.auth != null;
      allow write: if request.auth.uid == uid && request.auth.token.email_verified;

      match /posts/{postId} {
        allow read: if request.auth != null;
        allow write: if request.auth.uid == uid && request.auth.token.email_verified;

        match /postLikes/{activeUid} {
          allow write: if request.auth.uid == activeUid && request.auth.token.email_verified;
        }
        match /postMutes/{activeUid} {
          allow write: if request.auth.uid == activeUid && request.auth.token.email_verified;
        }
      }
      match /followers/{activeUid} {
        allow write: if request.auth.uid == activeUid && request.auth.token.email_verified;
      }
      match /userMutes/{activeUid} {
        allow write: if request.auth.uid == activeUid && request.auth.token.email_verified;
      }
      match /userUpdateLogs/{id} {
        allow write: if request.auth.uid == uid && request.auth.token.email_verified;
      }
      match /timelines/{postId} {
        allow read: if request.auth.uid == uid && request.auth.token.email_verified;
      }
    }
    match /private/v1/privateUsers/{uid} {
      allow read: if request.auth.uid == uid && request.auth.token.email_verified;
      allow write: if request.auth.uid == uid && request.auth.token.email_verified;

      match /tokens/{tokenId} {
        allow read, write: if request.auth.uid == uid && request.auth.token.email_verified;
      }
    }
  }
}''';

void main() {
  group('Security Rules Test', () {
    test('should allow access to own user document', () async {
      final auth = MockFirebaseAuth();
      final firestore = FakeFirebaseFirestore(
        securityRules: securityRules,
        authObject: auth.authForFakeFirestore,
      );
      final credential = await auth.signInWithCustomToken('some token');
      final uid = credential.user!.uid;
      expect(
        () => firestore.doc('public/v1/users/$uid').set({'name': 'abc'}),
        returnsNormally,
      );
    });

    test('should deny access to other user\'s document', () async {
      final auth = MockFirebaseAuth();
      final firestore = FakeFirebaseFirestore(
        securityRules: securityRules,
        authObject: auth.authForFakeFirestore,
      );
      await auth.signInWithCustomToken('some token');

      expect(
        () => firestore.doc('public/v1/users/abcdef').set({'name': 'abc'}),
        throwsException,
      );
    });
    test('should allow access to own post document', () async {
      final auth = MockFirebaseAuth();
      final firestore = FakeFirebaseFirestore(
        securityRules: securityRules,
        authObject: auth.authForFakeFirestore,
      );
      final credential = await auth.signInWithCustomToken('some token');
      final uid = credential.user!.uid;
      expect(
        () => firestore.doc('public/v1/users/$uid/posts/post123').set({'content': 'test post'}),
        returnsNormally,
      );
    });

    test('should deny access to other user\'s post document', () async {
      final auth = MockFirebaseAuth();
      final firestore = FakeFirebaseFirestore(
        securityRules: securityRules,
        authObject: auth.authForFakeFirestore,
      );
      await auth.signInWithCustomToken('some token');

      expect(
        () => firestore.doc('public/v1/users/abcdef/posts/post123').set({'content': 'test post'}),
        throwsException,
      );
    });
  });
}