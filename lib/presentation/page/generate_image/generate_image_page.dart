import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/consts/ui/form_consts.dart';
import 'package:great_talk/consts/logic/generate_image_constants.dart';
import 'package:great_talk/core/provider/view_model/generate_image/generate_image_view_model.dart';
import 'package:great_talk/presentation/common/toast_ui_core.dart';
import 'package:great_talk/presentation/component/basic_height_box.dart';
import 'package:great_talk/presentation/component/basic_page.dart';
import 'package:great_talk/presentation/component/basic_width_box.dart';
import 'package:great_talk/presentation/component/rounded_button.dart';
import 'package:great_talk/presentation/page/create_post/components/original_form.dart';
import 'package:great_talk/presentation/page/generate_image/components/generated_image.dart';
import 'package:great_talk/presentation/page/screen/loading_screen.dart';
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
    return BasicPage(
      appBarText: "AIを使用して画像を生成",
      child: state.when(
        data: (data) {
          final base64 = data.base64;
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              base64 != null
                  ? GeneratedImage(base64: base64)
                  : const SizedBox.shrink(),
              OriginalForm(
                decoration: const InputDecoration(
                  hintText: FormConsts.generateImageHint,
                ),
                keyboardType: TextInputType.text,
                onChanged: (text) => promptController.text = text ?? '',
              ),
              const BasicHeightBox(),
              Row(
                children: [
                  const Text("画像サイズ(横幅x縦幅)"),
                  const BasicWidthBox(),
                  DropdownButton<String>(
                    value: size.value,
                    onChanged: (value) => size.value = value ?? '',
                    items:
                        GenerateImageEnum.values.map((e) {
                          final text = e.text();
                          return DropdownMenuItem<String>(
                            value: text,
                            child: Text(text),
                          );
                        }).toList(),
                  ),
                ],
              ),
              const BasicHeightBox(),
              RoundedButton(
                text: "生成する",
                press: () async {
                  final result = await notifier().onGenerateButtonPressed(
                    promptController.text,
                    size.value,
                  );
                  result.when(
                    success: (res) {
                      notifier().onSuccess(res);
                    },
                    failure: (msg) {
                      ToastUiCore.showFailureSnackBar(context, msg);
                    },
                  );
                },
              ),
            ],
          );
        },
        loading: () => const LoadingScreen(),
        error: (e, s) => const SizedBox.shrink(),
      ),
    );
  }
}
