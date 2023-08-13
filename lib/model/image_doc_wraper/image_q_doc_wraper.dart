import 'dart:typed_data';

import 'package:great_talk/typedefs/firestore_typedef.dart';

class ImageQDocWraper {
  ImageQDocWraper(this.doc, this.uint8list);
  final QDoc doc;
  final Uint8List? uint8list;
}
