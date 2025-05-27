import 'package:flutter/material.dart';
import 'package:great_talk/core/router_core.dart';
import 'package:great_talk/views/components/rounded_button.dart';
import 'package:great_talk/views/edit_page.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key});
  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      buttonColor: Theme.of(context).colorScheme.primary,
      text: "編集する",
      textColor: Colors.white,
      press: () => RouterCore.pushPath(EditProfilePage.path),
    );
  }
}
