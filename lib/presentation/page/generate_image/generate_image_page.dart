import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/core/constant/generate_image_constants.dart';
import 'package:great_talk/presentation/notifier/generate_image/generate_image_view_model.dart';
import 'package:great_talk/presentation/util/toast_ui_util.dart';
import 'package:great_talk/presentation/page/generate_image/components/animated_gradient_background.dart';
import 'package:great_talk/presentation/page/generate_image/components/floating_particles.dart';
import 'package:great_talk/presentation/page/generate_image/components/modern_sliver_app_bar.dart';
import 'package:great_talk/presentation/page/generate_image/components/loading_state.dart';
import 'package:great_talk/presentation/page/generate_image/components/error_state.dart';
import 'package:great_talk/presentation/page/generate_image/components/generate_image_main_content.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class GenerateImagePage extends HookConsumerWidget {
  const GenerateImagePage({super.key});
  static const path = "/generateImage";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GenerateImageViewModel notifier() =>
        ref.read(generateImageViewModelProvider.notifier);
    final state = ref.watch(generateImageViewModelProvider);
    final promptController = useTextEditingController();
    final size = useState(GenerateImageEnum.sqare.text());
    final animationController = useAnimationController(
      duration: const Duration(seconds: 20),
    );
    final scrollController = useScrollController();

    useEffect(() {
      animationController.repeat();
      return null;
    }, []);

    Future<void> handleGenerate() async {
      final result = await notifier().onGenerateButtonPressed(
        promptController.text,
        size.value,
      );
      result.when(
        success: (res) {
          notifier().onSuccess(res);
        },
        failure: (msg) {
          ToastUiUtil.showFailureSnackBar(context, msg);
        },
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          AnimatedGradientBackground(animationController: animationController),
          FloatingParticles(animationController: animationController),
          SafeArea(
            child: CustomScrollView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [
                const ModernSliverAppBar(),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: state.when(
                      data: (data) => GenerateImageMainContent(
                        base64: data.base64,
                        promptController: promptController,
                        selectedSize: size.value,
                        onPromptChanged: (text) => promptController.text = text ?? '',
                        onSizeChanged: (newSize) => size.value = newSize,
                        onGenerate: handleGenerate,
                      ),
                      loading: () => const LoadingState(),
                      error: (e, s) => const ErrorState(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
