import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/core/util/aws_s3_util.dart';

void main() {
  group('AWSS3Util', () {
    group('profileObject', () {
      test('should generate correct profile object path', () {
        const uid = 'user123';
        final result = AWSS3Util.profileObject(uid);

        expect(result, 'user123/profile.jpg');
      });

      test('should handle empty uid', () {
        const uid = '';
        final result = AWSS3Util.profileObject(uid);

        expect(result, '/profile.jpg');
      });

      test('should handle uid with special characters', () {
        const uid = 'user-123_test@example.com';
        final result = AWSS3Util.profileObject(uid);

        expect(result, 'user-123_test@example.com/profile.jpg');
      });

      test('should handle uid with spaces', () {
        const uid = 'user 123';
        final result = AWSS3Util.profileObject(uid);

        expect(result, 'user 123/profile.jpg');
      });

      test('should handle uid with forward slashes', () {
        const uid = 'folder/user123';
        final result = AWSS3Util.profileObject(uid);

        expect(result, 'folder/user123/profile.jpg');
      });

      test('should handle very long uid', () {
        final uid = 'a' * 100;
        final result = AWSS3Util.profileObject(uid);

        expect(result, '$uid/profile.jpg');
        expect(result.length, 112); // 100 + '/profile.jpg'.length
      });

      test('should handle numeric uid', () {
        const uid = '123456789';
        final result = AWSS3Util.profileObject(uid);

        expect(result, '123456789/profile.jpg');
      });

      test('should handle uid with unicode characters', () {
        const uid = 'ユーザー123';
        final result = AWSS3Util.profileObject(uid);

        expect(result, 'ユーザー123/profile.jpg');
      });
    });

    group('postObject', () {
      test('should generate correct post object path', () {
        const uid = 'user123';
        const postId = 'post456';
        final result = AWSS3Util.postObject(uid, postId);

        expect(result, 'user123/posts/post456.jpg');
      });

      test('should handle empty uid and postId', () {
        const uid = '';
        const postId = '';
        final result = AWSS3Util.postObject(uid, postId);

        expect(result, '/posts/.jpg');
      });

      test('should handle uid and postId with special characters', () {
        const uid = 'user-123_test@example.com';
        const postId = 'post-456_image#1';
        final result = AWSS3Util.postObject(uid, postId);

        expect(result, 'user-123_test@example.com/posts/post-456_image#1.jpg');
      });

      test('should handle uid and postId with spaces', () {
        const uid = 'user 123';
        const postId = 'post 456';
        final result = AWSS3Util.postObject(uid, postId);

        expect(result, 'user 123/posts/post 456.jpg');
      });

      test('should handle uid and postId with forward slashes', () {
        const uid = 'folder/user123';
        const postId = 'subfolder/post456';
        final result = AWSS3Util.postObject(uid, postId);

        expect(result, 'folder/user123/posts/subfolder/post456.jpg');
      });

      test('should handle very long uid and postId', () {
        final uid = 'u' * 50;
        final postId = 'p' * 50;
        final result = AWSS3Util.postObject(uid, postId);

        expect(result, '$uid/posts/$postId.jpg');
        expect(result.length, 111);
      });

      test('should handle numeric uid and postId', () {
        const uid = '123456789';
        const postId = '987654321';
        final result = AWSS3Util.postObject(uid, postId);

        expect(result, '123456789/posts/987654321.jpg');
      });

      test('should handle uid and postId with unicode characters', () {
        const uid = 'ユーザー123';
        const postId = '投稿456';
        final result = AWSS3Util.postObject(uid, postId);

        expect(result, 'ユーザー123/posts/投稿456.jpg');
      });

      test('should maintain consistent path structure', () {
        const uid = 'testUser';
        const postId = 'testPost';
        final result = AWSS3Util.postObject(uid, postId);

        expect(result.startsWith(uid), true);
        expect(result.contains('/posts/'), true);
        expect(result.endsWith('.jpg'), true);

        final parts = result.split('/');
        expect(parts.length, 3);
        expect(parts[0], uid);
        expect(parts[1], 'posts');
        expect(parts[2], '$postId.jpg');
      });
    });

    group('path consistency', () {
      test('should generate different paths for different users', () {
        const uid1 = 'user1';
        const uid2 = 'user2';
        const postId = 'samePost';

        final result1 = AWSS3Util.postObject(uid1, postId);
        final result2 = AWSS3Util.postObject(uid2, postId);

        expect(result1, isNot(equals(result2)));
        expect(result1, 'user1/posts/samePost.jpg');
        expect(result2, 'user2/posts/samePost.jpg');
      });

      test('should generate different paths for different posts', () {
        const uid = 'sameUser';
        const postId1 = 'post1';
        const postId2 = 'post2';

        final result1 = AWSS3Util.postObject(uid, postId1);
        final result2 = AWSS3Util.postObject(uid, postId2);

        expect(result1, isNot(equals(result2)));
        expect(result1, 'sameUser/posts/post1.jpg');
        expect(result2, 'sameUser/posts/post2.jpg');
      });

      test('should use same file extension for both methods', () {
        const uid = 'testUser';
        const postId = 'testPost';

        final profilePath = AWSS3Util.profileObject(uid);
        final postPath = AWSS3Util.postObject(uid, postId);

        expect(profilePath.endsWith('.jpg'), true);
        expect(postPath.endsWith('.jpg'), true);
      });
    });
  });
}
