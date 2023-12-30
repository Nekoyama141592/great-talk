import 'package:flutter/material.dart';

class OfficialMark extends StatelessWidget {
  const OfficialMark({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.verified,
      size: 30.0,
      color: Theme.of(context).colorScheme.primary,
    );
  }
}
