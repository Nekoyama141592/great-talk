import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/core/constant/generate_image_constants.dart';
import 'package:great_talk/presentation/notifier/generate_image/generate_image_view_model.dart';
import 'package:great_talk/presentation/util/toast_ui_util.dart';
import 'package:great_talk/presentation/page/generate_image/components/animated_gradient_background.dart';
import 'package:great_talk/presentation/page/generate_image/components/floating_particles.dart';
import 'package:great_talk/presentation/page/generate_image/components/modern_sliver_app_bar.dart';
import 'package:great_talk/presentation/page/generate_image/components/glassmorphic_image_container.dart';
import 'package:great_talk/presentation/page/generate_image/components/modern_prompt_input.dart';
import 'package:great_talk/presentation/page/generate_image/components/size_selector.dart';
import 'package:great_talk/presentation/page/generate_image/components/generate_button.dart';
import 'package:great_talk/presentation/page/generate_image/components/loading_state.dart';
import 'package:great_talk/presentation/page/generate_image/components/error_state.dart';
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
                      data: (data) => _BuildMainContent(
                        data: data,
                        promptController: promptController,
                        size: size,
                        notifier: notifier,
                        context: context,
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

class _BuildMainContent extends StatelessWidget {
  const _BuildMainContent({
    required this.data,
    required this.promptController,
    required this.size,
    required this.notifier,
    required this.context,
  });

  final dynamic data;
  final TextEditingController promptController;
  final ValueNotifier<String> size;
  final GenerateImageViewModel Function() notifier;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    final base64 = data.base64;
    
    return Column(
      children: [
        if (base64 != null) ...[
          GlassmorphicImageContainer(base64: base64),
          const SizedBox(height: 32),
        ],
        ModernPromptInput(
          controller: promptController,
          onChanged: (text) => promptController.text = text ?? '',
        ),
        const SizedBox(height: 24),
        SizeSelector(size: size),
        const SizedBox(height: 32),
        GenerateButton(
          onPressed: () async {
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
          },
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}