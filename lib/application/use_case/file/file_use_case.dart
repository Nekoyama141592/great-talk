import 'package:great_talk/infrastructure/model/rest_api/get_object/request/get_object_request.dart';
import 'package:great_talk/infrastructure/repository/local_repository.dart';
import 'package:great_talk/infrastructure/repository/api_repository.dart';

class FileUseCase {
  FileUseCase({required this.localRepository, required this.repository});
  final LocalRepository localRepository;
  final ApiRepository repository;

  Future<String?> getObject(String bucketName, String fileName) async {
    if (fileName.isEmpty) {
      return null;
    }
    String? image = _getCachedUint8List(fileName); // キャッシュされている画像を取得.
    // キャッシュされていない場合、S3から取得.
    if (image == null) {
      final request = GetObjectRequest(object: fileName);
      final result = await repository.getObject(request);
      result.when(
        success: (res) {
          image = res;
          _cacheUint8List(fileName, res); // 画像を非同期でキャッシュする.
        },
        failure: (e) {
          image = null;
        },
      );
    }
    return image;
  }

  Future<void> _cacheUint8List(String fileName, String data) {
    return localRepository.setImage(fileName, data);
  }

  String? _getCachedUint8List(String fileName) {
    return localRepository.getImage(fileName);
  }
}
