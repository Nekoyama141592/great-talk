import 'package:flutter/material.dart';
import 'package:great_talk/consts/colors.dart';
import 'package:great_talk/util/size_core.dart';

class GradientScreen extends StatelessWidget {
  const GradientScreen({
    super.key,
    this.baseColor,
    this.top,
    this.header,
    required this.child,
  });

  final Color? baseColor;
  final Widget? top;
  final Widget? header;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final circular = SizeCore.defaultPadding(context) * 2;
    final color = baseColor ?? Theme.of(context).primaryColor;
    return SafeArea(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              color.withAlpha(alpha90),
              color.withAlpha(alpha40),
              color.withAlpha(alpha10),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (top != null) top!,
            if (header != null) header!,
            const SizedBox(height: 5.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(circular),
                    topRight: Radius.circular(circular),
                  ),
                ),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
