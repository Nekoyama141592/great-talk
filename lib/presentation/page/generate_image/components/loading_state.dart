import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100),
        Container(
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Column(
              children: [
                TweenAnimationBuilder(
                  duration: const Duration(seconds: 2),
                  tween: Tween<double>(begin: 0, end: 1),
                  builder: (context, double value, child) {
                    return Transform.rotate(
                      angle: value * 2 * math.pi,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF667eea), Color(0xFFf093fb)],
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(
                          Icons.auto_awesome,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                const Text(
                  'AI が魔法をかけています...',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '素晴らしい画像を生成中',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}