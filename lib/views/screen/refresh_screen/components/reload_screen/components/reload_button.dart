import 'package:flutter/material.dart';

class ReloadButton extends StatelessWidget {
  const ReloadButton({Key? key, required this.onReload}) : super(key: key);
  final void Function()? onReload;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: onReload,
        child: Icon(
          Icons.refresh,
          size: 100.0,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
