import 'package:flutter/material.dart';
import 'package:great_talk/consts/form_consts.dart';
import 'package:great_talk/extension/string_extension.dart';
import 'package:great_talk/ui_core/form_ui_core.dart';
import 'package:great_talk/presentation/page/create_post/components/form_label.dart';
import 'package:great_talk/presentation/page/create_post/components/original_form.dart';

class UsernameField extends StatelessWidget {
  const UsernameField({
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
        const FormLabel(title: "ニックネーム", helpMsg: FormConsts.userNameHelpMsg),
        OriginalForm(
          initialValue: initialValue,
          keyboardType: TextInputType.text,
          onSaved: onSaved,
          validator: (value) {
            if (value == null || value.length < FormConsts.nGramIndex) {
              return "${FormConsts.nGramIndex}文字以上の入力を行なってください";
            } else if (value.length > FormConsts.maxUserNameLimit) {
              return FormConsts.textLimitMsg(
                FormConsts.maxUserNameLimit,
                value,
              );
            } else if (value.invalidField) {
              return FormUiCore.invalidFieldMsg;
            }
            return null;
          },
        ),
      ],
    );
  }
}
