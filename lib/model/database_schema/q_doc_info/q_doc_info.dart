import 'dart:typed_data';

import 'package:great_talk/model/database_schema/public_user/public_user.dart';
import 'package:great_talk/typedef/firestore_typedef.dart';

class QDocInfo {
  QDocInfo({
    required this.publicUser,
    required this.qDoc,
    required this.userImage,
  });
  final PublicUser publicUser;
  final QDoc qDoc;
  final Uint8List? userImage;
}
