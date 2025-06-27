import 'package:flutter/material.dart';
import 'package:great_talk/consts/ui/form_consts.dart';
import 'package:great_talk/presentation/state/create_post/create_post_state.dart';
import 'package:great_talk/core/provider/view_model/create_post/create_post_view_model.dart';
import 'package:great_talk/presentation/page/create_post/components/description_field.dart';
import 'package:great_talk/presentation/page/create_post/components/system_prompt_field.dart';
import 'package:great_talk/presentation/page/create_post/components/title_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreatePostForm extends ConsumerWidget {
  const CreatePostForm({
    super.key,
    required this.formKey,
    required this.state,
    required this.deviceHeight,
  });

  final GlobalKey<FormState> formKey;
  final CreatePostState? state;
  final double deviceHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(createPostViewModelProvider.notifier);

    return SizedBox(
      height: deviceHeight * 0.50,
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SystemPromptField(
                initialValue:
                    state?.systemPrompt ?? FormConsts.defaultSystemPrompt,
                onSaved: viewModel.setSystemPrompt,
              ),
              DescriptionField(
                initialValue: state?.description ?? '',
                onSaved: viewModel.setDescription,
              ),
              TitleField(
                initialValue: state?.title ?? '',
                onSaved: viewModel.setTitle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
