import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      crossAxisAlignment: CrossAxisAlignment.start,
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
      width: 42,
      child: Column(
        children: [
          const SizedBox(height: 8),
          Text(
            day,
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: AppColors.secondaryText,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: isHighlighted ? AppColors.peach : Colors.transparent,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              date,
              style: GoogleFonts.poppins(
                fontSize: 13,
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
    return SizedBox(
      width: 38,
      height: 74,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Slim capsule like the reference
          // Background pill
          Positioned(
            top: 0, // was -2
            child: Container(
              width: 36, // was 34
              height: 72, // was 74
              decoration: BoxDecoration(
                color: AppColors.peach,
                borderRadius: BorderRadius.circular(36), // smoother capsule
              ),
            ),
          ),

          // WED
          Positioned(
            top: 10, // was 8
            child: Text(
              day,
              style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryText,
              ),
            ),
          ),

          // 4
          Positioned(
            top: 40, // was 39
            child: Text(
              date,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
