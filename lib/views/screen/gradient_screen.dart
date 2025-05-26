import 'package:flutter/material.dart';
import 'package:great_talk/core/doubles.dart';

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
    final circular = defaultPadding(context) * 2;
    final color = baseColor ?? Theme.of(context).primaryColor;
    return SafeArea(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              color.withOpacity(0.9),
              color.withOpacity(0.4),
              color.withOpacity(0.1),
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
