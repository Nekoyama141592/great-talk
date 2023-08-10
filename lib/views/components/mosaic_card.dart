import 'package:flutter/material.dart';
import 'package:great_talk/common/texts.dart';

class MosaicCard extends StatelessWidget {
  const MosaicCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Align(
          alignment: Alignment.center, child: BoldWhiteText("不適切なコンテンツ")),
    );
  }
}
