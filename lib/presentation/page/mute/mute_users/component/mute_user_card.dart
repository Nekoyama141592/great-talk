import 'package:flutter/material.dart';
import 'package:great_talk/core/util/image_url_util.dart';
import 'package:great_talk/presentation/util/texts.dart';
import 'package:great_talk/domain/entity/database/public_user/public_user_entity.dart';
import 'package:great_talk/presentation/component/circle_image/circle_image.dart';

class MuteUserCard extends StatelessWidget {
  const MuteUserCard({
    super.key,
    required this.passiveUserEntity,
    required this.onMuteUserCardTap,
  });
  final PublicUserEntity passiveUserEntity;
  final void Function() onMuteUserCardTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleImage(
        isModerated: passiveUserEntity.image.moderationModelVersion.isNotEmpty,
        imageUrl: ImageUrlUtil.getUserImageUrl(passiveUserEntity.uid),
      ),
      title: EllipsisText(passiveUserEntity.nameValue),
      onTap: onMuteUserCardTap,
    );
  }
}
