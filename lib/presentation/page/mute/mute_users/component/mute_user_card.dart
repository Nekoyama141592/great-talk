import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:great_talk/presentation/util/texts.dart';
import 'package:great_talk/infrastructure/model/database_schema/public_user/public_user.dart';
import 'package:great_talk/presentation/component/circle_image/circle_image.dart';

class MuteUserCard extends StatelessWidget {
  const MuteUserCard({
    super.key,
    required this.passiveUser,
    required this.uint8list,
    required this.onMuteUserCardTap,
  });
  final PublicUser passiveUser;
  final Uint8List? uint8list;
  final void Function() onMuteUserCardTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleImage(uint8list: uint8list),
      title: EllipsisText(passiveUser.nameValue),
      onTap: onMuteUserCardTap,
    );
  }
}
