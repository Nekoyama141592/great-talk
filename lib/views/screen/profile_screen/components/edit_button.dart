import 'package:flutter/material.dart';
import 'package:great_talk/controllers/my_profile_controller.dart';
import 'package:great_talk/views/components/rounded_button.dart';

class EditButton extends StatelessWidget {
  const EditButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = MyProfileController.to;
    return RoundedButton(text: "編集する", press: controller.onEditButtonPressed);
  }
}
