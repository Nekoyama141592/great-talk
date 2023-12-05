import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/consts/form_consts.dart';
import 'package:great_talk/model/image_info/original_image_info.dart';
import 'package:great_talk/repository/aws_s3_repository.dart';
import 'package:image/image.dart' as img;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FileUtility {
  FileUtility() {
    _fetchPrefs();
  }
  static SharedPreferences? prefs;
  static Future<Uint8List?> getCompressedImage() async {
    final xFile = await _pickImage();
    final croppedFile = await _cropImage(xFile);
    final jpgFile = await _convertToJpg(croppedFile);
    final compressedImage = await _compressImage(jpgFile);
    return compressedImage;
  }

  static Future<Uint8List?> getS3Image(
      String bucketName, String fileName) async {
    if (fileName.isEmpty) {
      return null;
    }
    Uint8List? uint8List = _getCachedUint8List(fileName); // キャッシュされている画像を取得.
    // キャッシュされていない場合、S3から取得.
    if (uint8List == null) {
      final repository = AWSS3Repository();
      final result = await repository.getObject(bucketName, fileName);
      result.when(success: (res) {
        uint8List = res;
        _cacheUint8List(fileName, res); // 画像を非同期でキャッシュする.
      }, failure: () {
        UIHelper.showErrorFlutterToast("画像の取得が失敗しました");
        uint8List = null;
      });
    }
    return uint8List;
  }

  static Future<void> _fetchPrefs() async =>
      prefs ??= await SharedPreferences.getInstance();

  static Future<void> _cacheUint8List(String fileName, Uint8List data) async {
    if (prefs == null) {
      _fetchPrefs();
      return;
    }
    final base64String = base64Encode(data);
    await prefs!.setString(fileName, base64String);
  }

  static Uint8List? _getCachedUint8List(String fileName) {
    if (prefs == null) {
      _fetchPrefs();
      return null;
    } else {
      final base64String = prefs!.getString(fileName);
      return base64String == null ? null : base64Decode(base64String);
    }
  }

  static Future<Uint8List?> _compressImage(File? jpgFile) async {
    if (jpgFile == null) {
      return null;
    }
    final result = await FlutterImageCompress.compressWithFile(
      jpgFile.path,
      minWidth: FormsConsts.minImageWidth,
      minHeight: FormsConsts.minImageHeight,
      quality: FormsConsts.imageQuality,
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

  static Future<OriginalImageInfo> getImageInfo(Uint8List imageBytes) async {
    ui.Codec codec1 = await ui.instantiateImageCodec(imageBytes);
    ui.FrameInfo frameInfo1 = await codec1.getNextFrame();
    int width = frameInfo1.image.width;
    int height = frameInfo1.image.height;
    return OriginalImageInfo(height: height, width: width);
  }

  static String get squareImageRequestMsg => Platform.isIOS
      ? FormsConsts.iosSquareImageRequestMsg
      : FormsConsts.androidSquareImageRequestMsg;
}
