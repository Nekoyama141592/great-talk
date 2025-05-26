import 'package:flutter/material.dart';
import 'package:great_talk/views/components/rounded_button.dart';

class FollowButton extends StatelessWidget {
  const FollowButton({
    super.key,
    required this.isFollow,
    required this.follow,
    required this.unFollow,
  });
  final bool isFollow;
  final void Function()? follow;
  final void Function()? unFollow;
  @override
  Widget build(BuildContext context) {
    return isFollow
        ? RoundedButton(text: "フォロー", textColor: Colors.white, press: follow)
        : RoundedButton(
          text: "アンフォロー",
          press: unFollow,
          buttonColor: Colors.grey,
        );
  }
}
