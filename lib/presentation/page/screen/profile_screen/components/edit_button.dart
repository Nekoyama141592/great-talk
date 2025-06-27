import 'package:flutter/material.dart';
import 'package:great_talk/util/route_core.dart';
import 'package:great_talk/presentation/component/rounded_button.dart';
import 'package:great_talk/presentation/page/edit/edit_page.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key});
  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      buttonColor: Theme.of(context).colorScheme.primary,
      text: "編集する",
      textColor: Colors.white,
      press: () => RouteCore.pushPath(context, EditProfilePage.path),
    );
  }
}
