import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/workout_header.dart';
import '../widgets/workout_summary.dart';
import '../widgets/running_progress_card.dart';
import '../widgets/exercise_list_card.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 430,
            height: 860,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(42),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x18FFFFFF),
                      offset: Offset(-6, -6),
                      blurRadius: 18,
                    ),
                    BoxShadow(
                      color: Color(0x14000000),
                      offset: Offset(6, 8),
                      blurRadius: 18,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WorkoutHeader(),
                      SizedBox(height: 18),
                      WorkoutSummary(),
                      SizedBox(height: 20),
                      RunningProgressCard(),
                      SizedBox(height: 16),
                      ExerciseListCard(),
                      const SizedBox(
                        height: 14,
                      ), // small gap like the reference

                      Expanded(
                        child: ClipRect(
                          child: Align(
                            alignment: Alignment.topCenter,
                            heightFactor:
                                0.12, // only the curved top is visible
                            child: Container(
                              width: double.infinity,
                              height: double
                                  .infinity, // fills the remaining bottom space
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(34),
                                  topRight: Radius.circular(34),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
