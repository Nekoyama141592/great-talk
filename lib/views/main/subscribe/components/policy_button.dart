import 'package:flutter/material.dart';

class PolicyButton extends StatelessWidget {
  const PolicyButton({Key? key, required this.label, required this.onPressed})
      : super(key: key);
  final String label;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: TextButton(
            onPressed: onPressed,
            child: Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).focusColor),
            )));
  }
}
