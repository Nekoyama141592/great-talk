import 'package:flutter/material.dart';
import 'package:great_talk/core/util/date_util.dart';

class DateText extends StatelessWidget {
  const DateText({super.key, required this.createdAt, required this.updatedAt});

  final DateTime? createdAt;
  final DateTime? updatedAt;

  @override
  Widget build(BuildContext context) {
    final createdDate = DateUtil.toYyyyMmDd(createdAt);
    final updatedDate = DateUtil.toYyyyMmDd(updatedAt);

    final dateText = '$createdDate作成, $updatedDate更新';

    return Text(
      dateText,
      style: Theme.of(
        context,
      ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
    );
  }
}
