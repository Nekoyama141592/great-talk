import 'package:flutter/material.dart';
import 'package:great_talk/consts/form_consts.dart';
import 'package:great_talk/core/extension/string_extension.dart';
import 'package:great_talk/ui_core/form_ui_core.dart';
import 'package:great_talk/presentation/page/create_post/components/form_label.dart';
import 'package:great_talk/presentation/page/create_post/components/original_form.dart';

class TitleField extends StatelessWidget {
  const TitleField({
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
        const FormLabel(title: "タイトル", helpMsg: FormConsts.titleHelpMsg),
        OriginalForm(
          initialValue: initialValue,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(hintText: FormConsts.hintTitle),
          onSaved: onSaved,
          validator: (value) {
            if (value!.length < FormConsts.nGramIndex) {
              return "${FormConsts.nGramIndex}文字以上の入力をしてください";
            } else if (value.length > FormConsts.maxTitleLimit) {
              return FormConsts.textLimitMsg(FormConsts.maxTitleLimit, value);
            } else if (value.invalidField) {
              return FormUiCore.invalidFieldMsg;
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }
}
