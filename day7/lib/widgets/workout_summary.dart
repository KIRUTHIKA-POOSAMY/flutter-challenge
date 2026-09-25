import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

class WorkoutSummary extends StatelessWidget {
  const WorkoutSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildWorkoutIcon(),
        const SizedBox(width: 18),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Workout',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '90 min',
                style: GoogleFonts.poppins(
                  fontSize: 44,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryText,
                ),
              ),
            ],
          ),
        ),

        const WorkoutBars(),
      ],
    );
  }

  Widget buildWorkoutIcon() {
    return Container(
      width: 56,
      height: 56,
      decoration: const BoxDecoration(
        color: Color(0xFFD8EEF5),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image.asset('assets/icons/biceps.png', width: 26, height: 26),
      ),
    );
  }
}

class WorkoutBars extends StatelessWidget {
  const WorkoutBars({super.key});

  @override
  Widget build(BuildContext context) {
    const heights = [
      18.0, // 1st black (small)
      44.0, // 2nd black (increased)
      44.0, // 3rd black (same as 2nd)
      50.0, // 4th green (tallest)
      28.0, // 5th green (same as 6th)
      28.0, // 6th black
      44.0, // 7th black (same as 2nd & 3rd)
    ];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(7, (index) {
        final isGreen = index == 3 || index == 4;

        return Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (isGreen)
                Container(
                  width: 6,
                  height: 6,
                  margin: const EdgeInsets.only(bottom: 4),
                  decoration: const BoxDecoration(
                    color: Color(0xFF98C73C),
                    shape: BoxShape.circle,
                  ),
                )
              else
                const SizedBox(height: 10),

              Container(
                width: 4,
                height: heights[index],
                decoration: BoxDecoration(
                  color: isGreen
                      ? const Color(0xFF98C73C)
                      : const Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
