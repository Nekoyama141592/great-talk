import 'package:flutter/material.dart';
import 'package:great_talk/views/components/text_field_container.dart';

class OriginalForm extends StatelessWidget {
  const OriginalForm(
      {super.key,
      this.initialValue,
      this.decoration,
      this.maxLines,
      this.keyboardType,
      this.onChanged,
      this.onSaved,
      this.validator});
  final String? initialValue;
  final InputDecoration? decoration;
  final int? maxLines;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        initialValue: initialValue,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: decoration,
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }
}
