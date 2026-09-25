import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class WorkoutHeader extends StatelessWidget {
  const WorkoutHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 54,
            height: 54,
            decoration: const BoxDecoration(
              color: Color(0xFFF5F5F2),
              shape: BoxShape.circle,
            ),
            child: Container(
              width: 52,
              height: 52,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x14000000),
                    blurRadius: 12,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.arrow_back,
                size: 22,
                color: AppColors.primaryText,
              ),
            ),
          ),
        ),

        Container(
          width: 142,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFF9F9F7),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.star_border, size: 22),

              // Edit icon with underline like the mockup
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.edit_outlined, size: 21),
                  const SizedBox(height: 2),
                  Container(width: 14, height: 1.5, color: Colors.black),
                ],
              ),

              const Icon(Icons.more_horiz, size: 22),
            ],
          ),
        ),
      ],
    );
  }
}
