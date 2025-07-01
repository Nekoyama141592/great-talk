import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:great_talk/core/constant/generate_image_constants.dart';

class SizeSelector extends StatelessWidget {
  const SizeSelector({super.key, required this.size});
  
  final ValueNotifier<String> size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.aspect_ratio,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            const Text(
              "画像サイズ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButton<String>(
                value: size.value,
                dropdownColor: const Color(0xFF667eea),
                underline: const SizedBox(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                onChanged: (value) => size.value = value ?? '',
                items: GenerateImageEnum.values.map((e) {
                  final text = e.text();
                  return DropdownMenuItem<String>(
                    value: text,
                    child: Text(text),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}