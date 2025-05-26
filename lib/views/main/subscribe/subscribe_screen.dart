import 'package:flutter/material.dart';
import 'package:great_talk/views/main/subscribe/components/policy_buttons.dart';

import 'package:great_talk/views/main/subscribe/components/product_list.dart';
import 'package:great_talk/views/main/subscribe/components/restore_button.dart';

class SubscribeScreen extends StatelessWidget {
  const SubscribeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [PolicyButtons(), RestoreButton(), ProductList()],
        ),
      ),
    );
  }
}
