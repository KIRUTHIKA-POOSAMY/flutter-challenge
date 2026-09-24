import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class MonthSelector extends StatelessWidget {
  const MonthSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.arrow_back, size: 22),
        buildMonthChip(),
        const Icon(Icons.arrow_forward, size: 22),
      ],
    );
  }

  Widget buildMonthChip() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.peach,
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Text(
        'Feb 2025',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}
