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
      final auth = MockFirebaseAuth(mockUser: null);
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
      final auth = MockFirebaseAuth(mockUser: null);
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
      final auth = MockFirebaseAuth(mockUser: null);
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
      final auth = MockFirebaseAuth(mockUser: null);
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

    test('should allow access to own postLikes document', () async {
      final auth = MockFirebaseAuth(mockUser: null);
      final firestore = FakeFirebaseFirestore(
        securityRules: securityRules,
        authObject: auth.authForFakeFirestore,
      );
      final credential = await auth.signInWithCustomToken('some token');
      final uid = credential.user!.uid;
      expect(
        () => firestore.doc('public/v1/users/otheruser/posts/post123/postLikes/$uid').set({'liked': true}),
        returnsNormally,
      );
    });

    test('should deny access to other user\'s postLikes document', () async {
      final auth = MockFirebaseAuth(mockUser: null);
      final firestore = FakeFirebaseFirestore(
        securityRules: securityRules,
        authObject: auth.authForFakeFirestore,
      );
      await auth.signInWithCustomToken('some token');

      expect(
        () => firestore.doc('public/v1/users/otheruser/posts/post123/postLikes/abcdef').set({'liked': true}),
        throwsException,
      );
    });

    test('should allow access to own postMutes document', () async {
      final auth = MockFirebaseAuth(mockUser: null);
      final firestore = FakeFirebaseFirestore(
        securityRules: securityRules,
        authObject: auth.authForFakeFirestore,
      );
      final credential = await auth.signInWithCustomToken('some token');
      final uid = credential.user!.uid;
      expect(
        () => firestore.doc('public/v1/users/otheruser/posts/post123/postMutes/$uid').set({'muted': true}),
        returnsNormally,
      );
    });

    test('should deny access to other user\'s postMutes document', () async {
      final auth = MockFirebaseAuth(mockUser: null);
      final firestore = FakeFirebaseFirestore(
        securityRules: securityRules,
        authObject: auth.authForFakeFirestore,
      );
      await auth.signInWithCustomToken('some token');

      expect(
        () => firestore.doc('public/v1/users/otheruser/posts/post123/postMutes/abcdef').set({'muted': true}),
        throwsException,
      );
    });

    test('should allow access to own followers document', () async {
      final auth = MockFirebaseAuth(mockUser: null);
      final firestore = FakeFirebaseFirestore(
        securityRules: securityRules,
        authObject: auth.authForFakeFirestore,
      );
      final credential = await auth.signInWithCustomToken('some token');
      final uid = credential.user!.uid;
      expect(
        () => firestore.doc('public/v1/users/otheruser/followers/$uid').set({'following': true}),
        returnsNormally,
      );
    });

    test('should deny access to other user\'s followers document', () async {
      final auth = MockFirebaseAuth(mockUser: null);
      final firestore = FakeFirebaseFirestore(
        securityRules: securityRules,
        authObject: auth.authForFakeFirestore,
      );
      await auth.signInWithCustomToken('some token');

      expect(
        () => firestore.doc('public/v1/users/otheruser/followers/abcdef').set({'following': true}),
        throwsException,
      );
    });

    test('should allow access to own userMutes document', () async {
      final auth = MockFirebaseAuth(mockUser: null);
      final firestore = FakeFirebaseFirestore(
        securityRules: securityRules,
        authObject: auth.authForFakeFirestore,
      );
      final credential = await auth.signInWithCustomToken('some token');
      final uid = credential.user!.uid;
      expect(
        () => firestore.doc('public/v1/users/otheruser/userMutes/$uid').set({'muted': true}),
        returnsNormally,
      );
    });

    test('should deny access to other user\'s userMutes document', () async {
      final auth = MockFirebaseAuth(mockUser: null);
      final firestore = FakeFirebaseFirestore(
        securityRules: securityRules,
        authObject: auth.authForFakeFirestore,
      );
      await auth.signInWithCustomToken('some token');

      expect(
        () => firestore.doc('public/v1/users/otheruser/userMutes/abcdef').set({'muted': true}),
        throwsException,
      );
    });

    test('should allow access to own timelines document', () async {
      final auth = MockFirebaseAuth(mockUser: null);
      final firestore = FakeFirebaseFirestore(
        securityRules: securityRules,
        authObject: auth.authForFakeFirestore,
      );
      final credential = await auth.signInWithCustomToken('some token');
      final uid = credential.user!.uid;
      expect(
        () => firestore.doc('public/v1/users/$uid/timelines/post123').get(),
        returnsNormally,
      );
    });

    test('should deny access to other user\'s timelines document', () async {
      final auth = MockFirebaseAuth(mockUser: null);
      final firestore = FakeFirebaseFirestore(
        securityRules: securityRules,
        authObject: auth.authForFakeFirestore,
      );
      await auth.signInWithCustomToken('some token');

      expect(
        () => firestore.doc('public/v1/users/abcdef/timelines/post123').get(),
        throwsException,
      );
    });

    test('should allow access to own privateUsers document', () async {
      final auth = MockFirebaseAuth(mockUser: null);
      final firestore = FakeFirebaseFirestore(
        securityRules: securityRules,
        authObject: auth.authForFakeFirestore,
      );
      final credential = await auth.signInWithCustomToken('some token');
      final uid = credential.user!.uid;
      expect(
        () => firestore.doc('private/v1/privateUsers/$uid').set({'privateData': 'test'}),
        returnsNormally,
      );
    });

    test('should deny access to other user\'s privateUsers document', () async {
      final auth = MockFirebaseAuth(mockUser: null);
      final firestore = FakeFirebaseFirestore(
        securityRules: securityRules,
        authObject: auth.authForFakeFirestore,
      );
      await auth.signInWithCustomToken('some token');

      expect(
        () => firestore.doc('private/v1/privateUsers/abcdef').set({'privateData': 'test'}),
        throwsException,
      );
    });

    test('should allow access to own tokens document', () async {
      final auth = MockFirebaseAuth(mockUser: null);
      final firestore = FakeFirebaseFirestore(
        securityRules: securityRules,
        authObject: auth.authForFakeFirestore,
      );
      final credential = await auth.signInWithCustomToken('some token');
      final uid = credential.user!.uid;
      expect(
        () => firestore.doc('private/v1/privateUsers/$uid/tokens/token123').set({'token': 'test'}),
        returnsNormally,
      );
    });

    test('should deny access to other user\'s tokens document', () async {
      final auth = MockFirebaseAuth(mockUser: null);
      final firestore = FakeFirebaseFirestore(
        securityRules: securityRules,
        authObject: auth.authForFakeFirestore,
      );
      await auth.signInWithCustomToken('some token');

      expect(
        () => firestore.doc('private/v1/privateUsers/abcdef/tokens/token123').set({'token': 'test'}),
        throwsException,
      );
    });
  });
}