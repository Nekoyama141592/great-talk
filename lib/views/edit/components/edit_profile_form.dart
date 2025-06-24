import 'package:flutter/material.dart';
import 'package:great_talk/model/view_model_state/edit/edit_state.dart';
import 'package:great_talk/provider/view_model/edit/edit_view_model.dart';
import 'package:great_talk/views/edit/components/bio_field.dart';
import 'package:great_talk/views/edit/components/username_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditProfileForm extends ConsumerWidget {
  const EditProfileForm({
    super.key,
    required this.formKey,
    required this.editModelData,
  });

  final GlobalKey<FormState> formKey;
  final EditState editModelData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(editViewModelProvider.notifier);

    return SizedBox(
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16.0),
              UsernameField(
                initialValue: editModelData.userName,
                onSaved: notifier.setUserName,
              ),
              const SizedBox(height: 16.0),
              BioField(
                initialValue: editModelData.bio,
                onSaved: notifier.setBio,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
