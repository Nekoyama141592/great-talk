import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:great_talk/consts/form_consts.dart';
import 'package:great_talk/domain/entity/image_info/original_image_info.dart';
import 'package:great_talk/model/rest_api/get_object/request/get_object_request.dart';
import 'package:great_talk/repository/local_repository.dart';
import 'package:great_talk/repository/api_repository.dart';
import 'package:image/image.dart' as img;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class FileUseCase {
  FileUseCase({required this.localRepository, required this.repository});
  final LocalRepository localRepository;
  final ApiRepository repository;
  Future<String?> getCompressedImage() async {
    final xFile = await _pickImage();
    final croppedFile = await _cropImage(xFile);
    final jpgFile = await _convertToJpg(croppedFile);
    final compressedImage = await _compressImage(jpgFile);
    return compressedImage != null ? base64Encode(compressedImage) : null;
  }

  Future<String?> getS3Image(String bucketName, String fileName) async {
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

  Future<Uint8List?> _compressImage(File? jpgFile) async {
    if (jpgFile == null) return null;
    final result = await FlutterImageCompress.compressWithFile(
      jpgFile.path,
      minWidth: FormConsts.minImageWidth,
      minHeight: FormConsts.minImageHeight,
      quality: FormConsts.imageQuality,
    );
    return result;
  }

  Future<File?> _convertToJpg(CroppedFile? croppedFile) async {
    if (croppedFile == null) {
      return null;
    }
    File inputFile = File(croppedFile.path);
    img.Image? image = img.decodeImage(inputFile.readAsBytesSync());

    if (image != null) {
      final Directory tempDir = await getTemporaryDirectory();
      return File("${tempDir.absolute.path}/converted.jpg")
        ..writeAsBytesSync(img.encodeJpg(image));
    } else {
      return null;
    }
  }

  Future<CroppedFile?> _cropImage(XFile? xFile) async {
    if (xFile == null) {
      return null;
    }
    final instance = ImageCropper();
    final result = await instance.cropImage(
      sourcePath: xFile.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
    );
    return result;
  }

  Future<XFile?> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  Future<OriginalImageInfo> getImageInfo(String base64Image) async {
    final imageBytes = base64Decode(base64Image);
    final codec1 = await ui.instantiateImageCodec(imageBytes);
    final frameInfo1 = await codec1.getNextFrame();
    final width = frameInfo1.image.width;
    final height = frameInfo1.image.height;
    return OriginalImageInfo(height: height, width: width);
  }

  String get squareImageRequestMsg =>
      Platform.isIOS
          ? FormConsts.iosSquareImageRequestMsg
          : FormConsts.androidSquareImageRequestMsg;
}
