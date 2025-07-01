import 'dart:math' as math;
import 'package:flutter/material.dart';

class AnimatedGradientBackground extends StatelessWidget {
  const AnimatedGradientBackground({
    super.key,
    required this.animationController,
  });

  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              transform: GradientRotation(
                animationController.value * 2 * math.pi,
              ),
              colors: [
                const Color(0xFF667eea).withValues(alpha: 0.8),
                const Color(0xFF764ba2).withValues(alpha: 0.8),
                const Color(0xFFf093fb).withValues(alpha: 0.8),
                const Color(0xFFf5576c).withValues(alpha: 0.8),
                const Color(0xFF4facfe).withValues(alpha: 0.8),
                const Color(0xFF00f2fe).withValues(alpha: 0.8),
              ],
            ),
          ),
        );
      },
    );
  }
}
