import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CalendarSection extends StatelessWidget {
  const CalendarSection({super.key});

  @override
  Widget build(BuildContext context) {
    const weekData = [
      {'day': 'SUN', 'date': '1'},
      {'day': 'MON', 'date': '2'},
      {'day': 'TUE', 'date': '3'},
      {'day': 'WED', 'date': '4'},
      {'day': 'THR', 'date': '5'},
      {'day': 'FRI', 'date': '6'},
      {'day': 'SAT', 'date': '7'},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: weekData.map((item) {
        final day = item['day']!;
        final date = item['date']!;

        if (day == 'WED') {
          return buildSelectedDay(day, date);
        }

        return buildNormalDay(
          day,
          date,
          isHighlighted: date == '1' || date == '2',
        );
      }).toList(),
    );
  }

  Widget buildNormalDay(String day, String date, {bool isHighlighted = false}) {
    return SizedBox(
      width: 40,
      child: Column(
        children: [
          const SizedBox(height: 8),
          Text(
            day,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.secondaryText,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: isHighlighted ? AppColors.peach : Colors.transparent,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              date,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSelectedDay(String day, String date) {
    return Container(
      width: 50,
      height: 86,
      decoration: BoxDecoration(
        color: AppColors.peach,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryText,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            date,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryText,
            ),
          ),
        ],
      ),
    );
  }
}
