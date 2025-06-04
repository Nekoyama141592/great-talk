import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:great_talk/consts/form_consts.dart';
import 'package:great_talk/model/database_schema/image_info/original_image_info.dart';
import 'package:great_talk/model/rest_api/get_object/request/get_object_request.dart';
import 'package:great_talk/repository/real/local/local_repository.dart';
import 'package:great_talk/repository/real/on_call/on_call_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image/image.dart' as img;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'file_usecase.g.dart';

@riverpod
FileUseCase fileUseCase(Ref ref) => FileUseCase(
  localRepository: ref.watch(localRepositoryProvider),
  repository: ref.watch(onCallRepositoryProvider),
);

class FileUseCase {
  FileUseCase({required this.localRepository, required this.repository});
  final LocalRepository localRepository;
  final OnCallRepository repository;
  Future<Uint8List?> getCompressedImage() async {
    final xFile = await _pickImage();
    final croppedFile = await _cropImage(xFile);
    final jpgFile = await _convertToJpg(croppedFile);
    final compressedImage = await _compressImage(jpgFile);
    return compressedImage;
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
    return localRepository.setImage(fileName,data);
  }

  String? _getCachedUint8List(String fileName) {
    return localRepository.getImage(fileName);
  }

  Future<Uint8List?> _compressImage(File? jpgFile) async {
    if (jpgFile == null) {
      return null;
    }
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

  Future<OriginalImageInfo> getImageInfo(Uint8List imageBytes) async {
    ui.Codec codec1 = await ui.instantiateImageCodec(imageBytes);
    ui.FrameInfo frameInfo1 = await codec1.getNextFrame();
    int width = frameInfo1.image.width;
    int height = frameInfo1.image.height;
    return OriginalImageInfo(height: height, width: width);
  }

  String get squareImageRequestMsg =>
      Platform.isIOS
          ? FormConsts.iosSquareImageRequestMsg
          : FormConsts.androidSquareImageRequestMsg;
}
