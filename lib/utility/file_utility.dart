import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/model/aws_s3_repository.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class FileUtility {
  static Future<Uint8List?> getCompressedImage() async {
    final xFile = await _pickImage();
    final croppedFile = await _cropImage(xFile);
    final compressedImage = await _compressImage(croppedFile);
    return compressedImage;
  }

  static Future<Uint8List?> getS3Image(String fileName) async {
    final repository = AWSS3Repository();
    final result = await repository.getImage(fileName);
    Uint8List? uint8List;
    result.when(success: (res) {
      uint8List = res;
    }, failure: () {
      UIHelper.showErrorFlutterToast("画像の取得が失敗しました");
      uint8List = null;
    });
    return uint8List;
  }

  static Future<Uint8List?> _compressImage(CroppedFile? croppedFile) async {
    if (croppedFile == null) {
      return null;
    }
    final result = await FlutterImageCompress.compressWithFile(
      croppedFile.path,
      minWidth: 512,
      minHeight: 512,
      quality: 80,
    );
    return result;
  }

  static Future<CroppedFile?> _cropImage(XFile? xFile) async {
    if (xFile == null) {
      return null;
    }
    final instance = ImageCropper();
    final result = await instance.cropImage(
      sourcePath: xFile.path,
      aspectRatioPresets: [CropAspectRatioPreset.square],
    );
    return result;
  }

  static Future<XFile?> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }
}
