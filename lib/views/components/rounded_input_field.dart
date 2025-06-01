import 'package:flutter/material.dart';
import 'package:great_talk/consts/colors.dart';
import 'package:great_talk/views/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  const RoundedInputField({
    super.key,
    required this.controller,
    required this.send,
  });

  final TextEditingController controller;
  final void Function()? send;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: InkWell(
        child: TextFormField(
          // これも要素
          keyboardType: TextInputType.emailAddress,
          controller: controller,
          cursorColor: Theme.of(context).highlightColor.withAlpha(alpha70),
          decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: send,
              child: const Icon(Icons.send, color: kPrimaryColor),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
