import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:great_talk/views/screen/gradient_screen.dart';

class SvgAndMsgScreen extends StatelessWidget {
  const SvgAndMsgScreen(
      {super.key,
      required this.title,
      required this.msg,
      required this.svgPath});

  final String title;
  final String msg;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: GradientScreen(
        top: const SizedBox.shrink(),
        header: Padding(
          padding: EdgeInsets.all(defaultPadding(context)),
          child: Text(
            title,
            style: TextStyle(
                fontSize: defaultHeaderTextSize(context),
                fontWeight: FontWeight.bold),
          ),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: defaultPadding(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  svgPath,
                  height: size.height * 0.3,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: defaultPadding(context)),
                  child: Text(
                    msg,
                    style: TextStyle(
                        fontSize: defaultHeaderTextSize(context) * 1.25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
