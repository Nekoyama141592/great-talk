import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:great_talk/common/colors.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/views/components/basic_height_box.dart';
import 'package:great_talk/views/components/rounded_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = CurrentUserController.to;
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding(context)),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              // 水平パディング
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "ログイン",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                SvgPicture.asset(
                  'assets/svgs/login-bro.svg',
                  height: fullHeight(context) * 0.30,
                ),
                // with custom text
                RoundedButton(
                  text: 'Googleで続ける',
                  textColor: Colors.white,
                  buttonColor: kSecondaryColor,
                  press: controller.onGoogleButtonPressed,
                  icon: const Icon(
                    FontAwesomeIcons.google,
                    color: Colors.black,
                  ),
                ),
                const BasicHeightBox(),
                if (Platform.isIOS)
                  RoundedButton(
                    text: 'Appleで続ける',
                    textColor: Colors.white,
                    buttonColor: Colors.black,
                    press: controller.onAppleButtonPressed,
                    icon: const Icon(
                      FontAwesomeIcons.apple,
                      color: Colors.white,
                    ),
                  ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
