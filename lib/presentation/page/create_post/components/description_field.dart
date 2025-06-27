import 'package:flutter/material.dart';
import 'package:great_talk/consts/ui/form_consts.dart';
import 'package:great_talk/presentation/page/create_post/components/form_label.dart';
import 'package:great_talk/presentation/page/create_post/components/original_form.dart';

class DescriptionField extends StatelessWidget {
  const DescriptionField({
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
          title: "説明/使い方(AIの一言目)",
          helpMsg: FormConsts.descriptionHelpMsg,
        ),
        OriginalForm(
          initialValue: initialValue,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: const InputDecoration(
            hintText: FormConsts.hintDescription,
          ),
          onSaved: onSaved,
          validator: (value) {
            if (value!.isEmpty) {
              return "入力をしてください";
            } else if (value.length > FormConsts.maxDescriptionLimit) {
              return FormConsts.textLimitMsg(
                FormConsts.maxDescriptionLimit,
                value,
              );
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }
}
