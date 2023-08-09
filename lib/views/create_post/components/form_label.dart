import 'package:flutter/material.dart';

class FormLabel extends StatelessWidget {
  final String title;

  const FormLabel({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(title),
    );
  }
}
