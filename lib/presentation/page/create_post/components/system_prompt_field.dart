import 'package:flutter/material.dart';
import 'package:great_talk/consts/ui/form_consts.dart';
import 'package:great_talk/presentation/page/create_post/components/form_label.dart';
import 'package:great_talk/presentation/page/create_post/components/original_form.dart';

class SystemPromptField extends StatelessWidget {
  const SystemPromptField({
    super.key,
    required this.initialValue,
    required this.onSaved,
  });

  final String initialValue;
  final Function(String?) onSaved;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FormLabel(
          title: "システムプロンプト",
          helpMsg: FormConsts.systemPromptHelpMsg,
        ),
        OriginalForm(
          initialValue: initialValue,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          onSaved: onSaved,
          validator: (value) {
            if (value!.isEmpty) {
              return "入力をしてください";
            } else if (value.length > FormConsts.maxSystemPromptLimit) {
              return FormConsts.textLimitMsg(
                FormConsts.maxSystemPromptLimit,
                value,
              );
            } else if (value == FormConsts.defaultSystemPrompt) {
              return "初期値から変更してください。";
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }
}
