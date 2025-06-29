import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:great_talk/presentation/constant/form_consts.dart';
import 'package:great_talk/core/util/route_util.dart';
import 'package:great_talk/presentation/state/create_post/create_post_state.dart';
import 'package:great_talk/presentation/notifier/create_post/create_post_view_model.dart';
import 'package:great_talk/presentation/page/generate_image/generate_image_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ImagePickerWidget extends ConsumerWidget {
  const ImagePickerWidget({
    super.key,
    required this.state,
    required this.isPremiumSubscribing,
  });

  final CreatePostState? state;
  final bool isPremiumSubscribing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(createPostViewModelProvider.notifier);
    final pickedImageBase64 = state?.pickedImage;
    final Uint8List? imageBytes =
        pickedImageBase64 != null ? base64Decode(pickedImageBase64) : null;

    return imageBytes == null
        ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: viewModel.onImagePickButtonPressed,
              child: const Icon(Icons.image, size: 100.0),
            ),
            const SizedBox(width: 16),
            if (isPremiumSubscribing)
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(FormConsts.imageLabel), ToGeneratePageButton()],
              ),
          ],
        )
        : InkWell(
          onTap: viewModel.onImagePickButtonPressed,
          child: SizedBox(
            width: 100.0,
            height: 100.0,
            child: Image.memory(imageBytes),
          ),
        );
  }
}

class ToGeneratePageButton extends StatelessWidget {
  const ToGeneratePageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => RouteUtil.pushPath(context, GenerateImagePage.path),
      child: Text(
        "画像を生成する",
        style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
      ),
    );
  }
}
