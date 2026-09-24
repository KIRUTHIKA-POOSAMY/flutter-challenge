import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/calendar_section.dart';
import '../widgets/header_section.dart';
import '../widgets/month_selector.dart';
import '../widgets/metric_card.dart';
import 'workout_screen.dart';
import '../widgets/weekly_points_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(18),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 430),
              child: Container(
                decoration: buildContainerDecoration(),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const HeaderSection(),
                      const SizedBox(height: 20),

                      const MonthSelector(),
                      const SizedBox(height: 16),

                      const CalendarSection(),
                      const SizedBox(height: 16),

                      Row(
                        children: [
                          Expanded(
                            child: MetricCard(
                              title: 'Time',
                              value: '1:30',
                              subtitle: 'Hours',
                              backgroundColor: AppColors.blueCard,
                              icon: Icons.access_time,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: MetricCard(
                              title: 'Exercises',
                              value: '12/8',
                              subtitle: 'Tasks',
                              backgroundColor: AppColors.greenCard,
                              icon: Icons.remove_red_eye,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const WorkoutScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      const WeeklyPointsCard(),
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

  BoxDecoration buildContainerDecoration() {
    return BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(40),
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
    );
  }
}
