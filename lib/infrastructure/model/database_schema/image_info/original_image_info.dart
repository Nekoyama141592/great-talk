import 'package:great_talk/presentation/constant/form_consts.dart';

class OriginalImageInfo {
  const OriginalImageInfo({required this.height, required this.width});
  final int height;
  final int width;
  bool get isNotSquare => height != width;
  bool get isSmall =>
      height < FormConsts.minImageHeight || width < FormConsts.minImageWidth;
}
