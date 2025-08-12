import 'package:flutter_dotenv/flutter_dotenv.dart';

class ImageUrlUtil {
  static String _getR2Endpoint() => dotenv.get('R2_ENDPOINT');

  static String getUserImageUrl({required String uid, required String key}) {
    final baseUrl = '${_getR2Endpoint()}/users/$uid/${key.split('/').last}';
    return baseUrl;
  }

  static String getPostImageUrl({required String uid, required String postId, required String key}) {
    final baseUrl = '${_getR2Endpoint()}/users/$uid/posts/$postId/${key.split('/').last}';
    return baseUrl;
  }
}
