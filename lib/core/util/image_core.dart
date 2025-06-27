import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:great_talk/presentation/constant/form_consts.dart';
import 'package:great_talk/infrastructure/model/database_schema/image_info/original_image_info.dart';
import 'package:image/image.dart' as img;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImageCore {
  static Future<OriginalImageInfo> imageInfo(String base64Image) async {
    final imageBytes = base64Decode(base64Image);
    final codec1 = await ui.instantiateImageCodec(imageBytes);
    final frameInfo1 = await codec1.getNextFrame();
    final width = frameInfo1.image.width;
    final height = frameInfo1.image.height;
    return OriginalImageInfo(height: height, width: width);
  }

  static Future<String?> getCompressedImage() async {
    final xFile = await _pickImage();
    final croppedFile = await _cropImage(xFile);
    final jpgFile = await _convertToJpg(croppedFile);
    final compressedImage = await _compressImage(jpgFile);
    return compressedImage != null ? base64Encode(compressedImage) : null;
  }

  static Future<Uint8List?> _compressImage(File? jpgFile) async {
    if (jpgFile == null) return null;
    final result = await FlutterImageCompress.compressWithFile(
      jpgFile.path,
      minWidth: FormConsts.minImageWidth,
      minHeight: FormConsts.minImageHeight,
      quality: FormConsts.imageQuality,
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
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
    );
    return result;
  }

  static Future<XFile?> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }
}
