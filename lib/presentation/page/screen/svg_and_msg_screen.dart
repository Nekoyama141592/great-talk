import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:great_talk/core/util/size_util.dart';
import 'package:great_talk/presentation/page/screen/gradient_screen.dart';

class SvgAndMsgScreen extends StatelessWidget {
  const SvgAndMsgScreen({
    super.key,
    required this.title,
    required this.msg,
    required this.svgPath,
  });

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
          padding: EdgeInsets.all(SizeUtil.defaultPadding(context)),
          child: Text(
            title,
            style: TextStyle(
              fontSize: SizeUtil.defaultHeaderTextSize(context),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeUtil.defaultPadding(context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(svgPath, height: size.height * 0.3),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeUtil.defaultPadding(context),
                  ),
                  child: Text(
                    msg,
                    style: TextStyle(
                      fontSize: SizeUtil.defaultHeaderTextSize(context) * 1.25,
                      fontWeight: FontWeight.bold,
                    ),
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
