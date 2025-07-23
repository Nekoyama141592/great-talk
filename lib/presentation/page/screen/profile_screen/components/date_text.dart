import 'package:flutter/material.dart';
import 'package:great_talk/core/util/date_util.dart';
import 'package:great_talk/presentation/constant/colors.dart';

class DateText extends StatelessWidget {
  const DateText({super.key, required this.createdAt, required this.updatedAt});

  final DateTime? createdAt;
  final DateTime? updatedAt;

  @override
  Widget build(BuildContext context) {
    final createdDate = DateUtil.toYyyyMmDd(createdAt);
    final updatedDate = DateUtil.toYyyyMmDd(updatedAt);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(13),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withAlpha(26),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildDateItem(
            icon: Icons.calendar_month_outlined,
            label: "作成日",
            date: createdDate,
            color: kPrimaryColor,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: 1,
            height: 24,
            color: Colors.white.withAlpha(26),
          ),
          _buildDateItem(
            icon: Icons.update_outlined,
            label: "更新日",
            date: updatedDate,
            color: kAccentColorDarkTheme,
          ),
        ],
      ),
    );
  }

  Widget _buildDateItem({
    required IconData icon,
    required String label,
    required String date,
    required Color color,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: color.withAlpha(26),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(
            icon,
            size: 14,
            color: color,
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.white.withAlpha(179),
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              date,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
