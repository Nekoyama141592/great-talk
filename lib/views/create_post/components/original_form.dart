import 'package:flutter/material.dart';
import 'package:great_talk/views/components/text_field_container.dart';

class OriginalForm extends StatelessWidget {
  const OriginalForm(
      {Key? key,
      this.initialValue,
      this.decoration,
      this.maxLines,
      this.keyboardType,
      this.onSaved,
      this.validator})
      : super(key: key);
  final String? initialValue;
  final InputDecoration? decoration;
  final int? maxLines;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        initialValue: initialValue,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: decoration,
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }
}
