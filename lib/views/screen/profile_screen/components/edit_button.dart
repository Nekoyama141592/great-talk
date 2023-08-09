import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/views/components/rounded_button.dart';

class EditButton extends StatelessWidget {
  const EditButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RoundedButton(text: "編集する", press: () => Get.toNamed('/edit'));
  }
}
