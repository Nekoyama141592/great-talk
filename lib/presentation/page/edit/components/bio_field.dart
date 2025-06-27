import 'package:flutter/material.dart';
import 'package:great_talk/consts/ui/form_consts.dart';
import 'package:great_talk/presentation/page/create_post/components/form_label.dart';
import 'package:great_talk/presentation/page/create_post/components/original_form.dart';

class BioField extends StatelessWidget {
  const BioField({
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
        const FormLabel(title: "紹介文", helpMsg: FormConsts.bioHelpMsg),
        OriginalForm(
          initialValue: initialValue,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          onSaved: onSaved,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "入力を行なってください";
            } else if (value.length > FormConsts.maxBioLimit) {
              return FormConsts.textLimitMsg(FormConsts.maxBioLimit, value);
            }
            return null;
          },
        ),
      ],
    );
  }
}
