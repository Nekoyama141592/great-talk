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
  group('Security Rules Test with Email Verification', () {
    group('when user email is verified', () {
      late MockFirebaseAuth auth;
      late FakeFirebaseFirestore firestore;
      late String uid;

      setUp(() async {
        // isEmailVerified: true のモックユーザーを作成
        final mockUser = MockUser(
          isAnonymous: false,
          uid: 'some_uid',
          email: 'test@example.com',
          displayName: 'Test User',
          isEmailVerified: true, // メールアドレス認証済み
        );
        auth = MockFirebaseAuth(mockUser: mockUser, signedIn: true);
        firestore = FakeFirebaseFirestore(
          securityRules: securityRules,
          authObject: auth.authForFakeFirestore,
        );
        uid = auth.currentUser!.uid;
      });

      test('should allow writing to own user document', () {
        expect(
          () => firestore.doc('public/v1/users/$uid').set({'name': 'abc'}),
          returnsNormally,
        );
      });

      test('should allow writing to own post document', () {
        expect(
          () => firestore
              .doc('public/v1/users/$uid/posts/post123')
              .set({'content': 'test post'}),
          returnsNormally,
        );
      });

      test('should allow liking a post (write to postLikes)', () {
        expect(
          () => firestore
              .doc('public/v1/users/otheruser/posts/post123/postLikes/$uid')
              .set({'liked': true}),
          returnsNormally,
        );
      });

       test('should allow read from own timeline', () {
        expect(
          () => firestore.doc('public/v1/users/$uid/timelines/post123').get(),
          returnsNormally,
        );
      });

      test('should allow writing to own private user document', () {
        expect(
          () => firestore
              .doc('private/v1/privateUsers/$uid')
              .set({'privateData': 'test'}),
          returnsNormally,
        );
      });
    });

    group('when user email is not verified', () {
      late MockFirebaseAuth auth;
      late FakeFirebaseFirestore firestore;
      late String uid;

      setUp(() async {
        // isEmailVerified: false のモックユーザーを作成
        final mockUser = MockUser(
          isAnonymous: false,
          uid: 'some_uid',
          email: 'test@example.com',
          displayName: 'Test User',
          isEmailVerified: false, // メールアドレス未認証
        );
        auth = MockFirebaseAuth(mockUser: mockUser, signedIn: true);
        firestore = FakeFirebaseFirestore(
          securityRules: securityRules,
          authObject: auth.authForFakeFirestore,
        );
        uid = auth.currentUser!.uid;
      });

      test('should deny writing to own user document', () {
        expect(
          () => firestore.doc('public/v1/users/$uid').set({'name': 'abc'}),
          throwsException,
        );
      });

      test('should deny writing to own post document', () {
        expect(
          () => firestore
              .doc('public/v1/users/$uid/posts/post123')
              .set({'content': 'test post'}),
          throwsException,
        );
      });

      test('should deny liking a post (write to postLikes)', () {
        expect(
          () => firestore
              .doc('public/v1/users/otheruser/posts/post123/postLikes/$uid')
              .set({'liked': true}),
          throwsException,
        );
      });

      // 読み取りは認証さえしていれば通るはず
      test('should allow reading user document even if email is not verified', () {
         expect(
          () => firestore.doc('public/v1/users/anyuser').get(),
          returnsNormally,
        );
      });

      // email_verified が read の条件になっている timeline は失敗する
       test('should deny reading from own timeline if email is not verified', () {
        expect(
          () => firestore.doc('public/v1/users/$uid/timelines/post123').get(),
          throwsException,
        );
      });


      test('should deny writing to own private user document', () {
        expect(
          () => firestore
              .doc('private/v1/privateUsers/$uid')
              .set({'privateData': 'test'}),
          throwsException,
        );
      });
    });
  });
  // isEmailVerifiedがtrue
  group('when user signInWithCustomToken', () {
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