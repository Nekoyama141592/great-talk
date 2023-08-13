import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/model/aws_s3_repository.dart';
import 'package:image/image.dart' as img;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class FileUtility {
  static Future<Uint8List?> getCompressedImage() async {
    final xFile = await _pickImage();
    final croppedFile = await _cropImage(xFile);
    final jpgFile = await _convertToJpg(croppedFile);
    final compressedImage = await _compressImage(jpgFile);
    return compressedImage;
  }

  static Future<Uint8List?> getS3Image(
      String bucketName, String fileName) async {
    final repository = AWSS3Repository();
    if (fileName.isEmpty) {
      return null;
    }
    final result = await repository.getImage(bucketName, fileName);
    Uint8List? uint8List;
    result.when(success: (res) {
      uint8List = res;
    }, failure: () {
      UIHelper.showErrorFlutterToast("画像の取得が失敗しました");
      uint8List = null;
    });
    return uint8List;
  }

  static Future<Uint8List?> _compressImage(File? jpgFile) async {
    if (jpgFile == null) {
      return null;
    }
    final result = await FlutterImageCompress.compressWithFile(
      jpgFile.path,
      minWidth: 512,
      minHeight: 512,
      quality: 80,
    );
    return result;
  }

  static Future<File?> _convertToJpg(CroppedFile? croppedFile) async {
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
