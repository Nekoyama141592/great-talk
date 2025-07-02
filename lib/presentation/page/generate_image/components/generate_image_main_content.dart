import 'package:flutter/material.dart';
import 'package:great_talk/presentation/page/generate_image/components/glassmorphic_image_container.dart';
import 'package:great_talk/presentation/page/generate_image/components/modern_prompt_input.dart';
import 'package:great_talk/presentation/page/generate_image/components/size_selector.dart';
import 'package:great_talk/presentation/page/generate_image/components/generate_button.dart';

class GenerateImageMainContent extends StatelessWidget {
  const GenerateImageMainContent({
    super.key,
    required this.base64,
    required this.promptController,
    required this.selectedSize,
    required this.onPromptChanged,
    required this.onSizeChanged,
    required this.onGenerate,
  });

  final String? base64;
  final TextEditingController promptController;
  final String selectedSize;
  final void Function(String?) onPromptChanged;
  final void Function(String) onSizeChanged;
  final Future<void> Function() onGenerate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (base64 != null) ...[
          GlassmorphicImageContainer(base64: base64!),
          const SizedBox(height: 32),
        ],
        ModernPromptInput(
          controller: promptController,
          onChanged: onPromptChanged,
        ),
        const SizedBox(height: 24),
        _SizeSelectorWrapper(
          selectedSize: selectedSize,
          onSizeChanged: onSizeChanged,
        ),
        const SizedBox(height: 32),
        GenerateButton(
          onPressed: onGenerate,
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

class _SizeSelectorWrapper extends StatefulWidget {
  const _SizeSelectorWrapper({
    required this.selectedSize,
    required this.onSizeChanged,
  });

  final String selectedSize;
  final void Function(String) onSizeChanged;

  @override
  State<_SizeSelectorWrapper> createState() => _SizeSelectorWrapperState();
}

class _SizeSelectorWrapperState extends State<_SizeSelectorWrapper> {
  late ValueNotifier<String> _sizeNotifier;

  @override
  void initState() {
    super.initState();
    _sizeNotifier = ValueNotifier(widget.selectedSize);
    _sizeNotifier.addListener(() {
      widget.onSizeChanged(_sizeNotifier.value);
    });
  }

  @override
  void didUpdateWidget(_SizeSelectorWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedSize != widget.selectedSize) {
      _sizeNotifier.value = widget.selectedSize;
    }
  }

  @override
  void dispose() {
    _sizeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeSelector(size: _sizeNotifier);
  }
}