import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:great_talk/consts/colors.dart';
import 'package:great_talk/core/size_core.dart';
import 'package:great_talk/views/components/basic_height_box.dart';
import 'package:great_talk/views/components/rounded_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
    required this.onAppleButtonPressed,
    required this.onGoogleButtonPressed,
    required this.title,
  });
  final void Function()? onAppleButtonPressed;
  final void Function()? onGoogleButtonPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeCore.defaultPadding(context),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            // 水平パディング
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SvgPicture.asset(
                'assets/svgs/login-bro.svg',
                height: SizeCore.fullHeight(context) * 0.30,
              ),
              // with custom text
              RoundedButton(
                text: 'Googleで続ける',
                textColor: Colors.white,
                buttonColor: kSecondaryColor,
                press: onGoogleButtonPressed,
                icon: const Icon(FontAwesomeIcons.google, color: Colors.black),
              ),
              const BasicHeightBox(),
              if (Platform.isIOS)
                RoundedButton(
                  text: 'Appleで続ける',
                  textColor: Theme.of(context).scaffoldBackgroundColor,
                  buttonColor: Theme.of(context).focusColor,
                  press: onAppleButtonPressed,
                  icon: Icon(
                    FontAwesomeIcons.apple,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
