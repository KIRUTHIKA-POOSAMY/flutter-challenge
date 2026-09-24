import 'dart:math' as math;

import 'package:flutter/material.dart';

void main() => runApp(const FitnessApp());

/// ------------------------------------------------------------
/// COLOR PALETTE
/// ------------------------------------------------------------
class AppColors {
  static const background = Color(0xFFF1F1F3);
  static const white = Colors.white;

  // Reddish-pink accents
  static const reddishPink = Color(0xFFF68378);
  static const reddishPinkLight = Color(0xFFFDE8E4);
  static const reddishPinkPillBg = Color(0xFFF68378);

  // Cards
  static const blueCard = Color(0xFFD4EEF9);
  static const blueIconBg = Color(0xFF67B5D4);
  static const greenCard = Color(0xFFE2F0BD);
  static const greenIconBg = Color(0xFF86B441);

  // Screen 1 Gauge & Chart
  static const gaugeTrack = Color(0xFFE5E7DD);
  static const gaugeGreen = Color(0xFF7CB342);
  static const textDark = Color(0xFF1B1B1E);
  static const textGrey = Color(0xFF8E8E93);
  static const chartLine = Color(0xFF3896BE);
  static const chartBorder = Color(0xFFE5E5EA);

  // Screen 2 Specifics
  static const stopBtnBg = Color(0xFFFBD6C6);
  static const dialTrack = Color(0xFFE2F3FA);
  static const dialGreen = Color(0xFF84BA3F);
  static const dialOrange = Color(0xFFE58D36);
  static const heartPeach = Color(0xFFF79E78);
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'sans-serif',
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}

/// ------------------------------------------------------------
/// SMOOTH PAGE ROUTE TRANSITION
/// ------------------------------------------------------------
Route _createWorkoutRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const WorkoutDetailScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.06, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeOutCubic;

      final tween = Tween(
        begin: begin,
        end: end,
      ).chain(CurveTween(curve: curve));
      final fadeTween = Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).chain(CurveTween(curve: Curves.easeIn));

      return SlideTransition(
        position: animation.drive(tween),
        child: FadeTransition(
          opacity: animation.drive(fadeTween),
          child: child,
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 320),
  );
}

/// ------------------------------------------------------------
/// SCREEN 1: DASHBOARD
/// ------------------------------------------------------------
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DateTime _visibleMonth = DateTime(2025, 2, 1);
  int _selectedDayIndex = 3; // Wednesday 4th

  final List<String> _weekDayLabels = [
    'SUN',
    'MON',
    'TUE',
    'WED',
    'THR',
    'FRI',
    'SAT',
  ];
  final List<int> _days = [1, 2, 3, 4, 5, 6, 7];

  void _navigateToWorkoutDetail() {
    Navigator.of(context).push(_createWorkoutRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Profile Header
              _buildHeader(),
              const SizedBox(height: 24),

              // 2. Month Selector
              _buildMonthNavigator(),
              const SizedBox(height: 20),

              // 3. Weekday Row
              _buildDayRow(),
              const SizedBox(height: 22),

              // 4. Quick Stat Cards (Time & Exercises)
              Row(
                children: [
                  Expanded(
                    child: _buildMetricCard(
                      title: 'Time',
                      value: '1:30',
                      unit: 'Hours',
                      bgColor: AppColors.blueCard,
                      icon: Icons.access_time_filled_rounded,
                      iconBg: AppColors.blueIconBg,
                      onTap: _navigateToWorkoutDetail,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: _buildMetricCard(
                      title: 'Exercises',
                      value: '12/8',
                      unit: 'Tasks',
                      bgColor: AppColors.greenCard,
                      icon: Icons.radio_button_checked,
                      iconBg: AppColors.greenIconBg,
                      onTap: _navigateToWorkoutDetail,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),

              // 5. Weekly Points & Line Chart Card
              _buildWeeklyPointsCard(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(26),
          child: SizedBox(
            width: 52,
            height: 52,
            child: Image.network(
              'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=200&auto=format&fit=crop&q=80',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey.shade300,
                child: const Icon(Icons.person, color: Colors.white),
              ),
            ),
          ),
        ),
        const SizedBox(width: 14),
        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 18,
              color: AppColors.textDark,
              letterSpacing: -0.2,
            ),
            children: [
              TextSpan(
                text: 'Hello, ',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              TextSpan(
                text: 'Sophia',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        const Spacer(),
        Stack(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.notifications_none_rounded,
                size: 22,
                color: AppColors.textDark,
              ),
            ),
            Positioned(
              right: 12,
              top: 10,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFFEF4444),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMonthNavigator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          splashRadius: 20,
          icon: const Icon(
            Icons.arrow_back,
            size: 18,
            color: AppColors.textDark,
          ),
          onPressed: () {
            setState(() {
              _visibleMonth = DateTime(
                _visibleMonth.year,
                _visibleMonth.month - 1,
              );
            });
          },
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.reddishPink,
            borderRadius: BorderRadius.circular(22),
          ),
          child: const Text(
            'Feb 2025',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
        IconButton(
          splashRadius: 20,
          icon: const Icon(
            Icons.arrow_forward,
            size: 18,
            color: AppColors.textDark,
          ),
          onPressed: () {
            setState(() {
              _visibleMonth = DateTime(
                _visibleMonth.year,
                _visibleMonth.month + 1,
              );
            });
          },
        ),
      ],
    );
  }

  Widget _buildDayRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(7, (index) {
        final isSelected = index == _selectedDayIndex;
        final isPast = index < _selectedDayIndex;

        return GestureDetector(
          onTap: () => setState(() => _selectedDayIndex = index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.symmetric(
              horizontal: 8,
              vertical: isSelected ? 8 : 4,
            ),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.reddishPinkPillBg
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                Text(
                  _weekDayLabels[index],
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textGrey,
                    letterSpacing: 0.2,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected
                        ? AppColors.reddishPink
                        : (isPast
                              ? AppColors.reddishPinkLight
                              : Colors.transparent),
                  ),
                  child: Text(
                    '${_days[index]}',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: isSelected
                          ? Colors.white
                          : (isPast
                                ? AppColors.reddishPink
                                : AppColors.textDark),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String value,
    required String unit,
    required Color bgColor,
    required IconData icon,
    required Color iconBg,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: iconBg,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: 14, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 22),
            Text(
              value,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: AppColors.textDark,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              unit,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.textDark.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeeklyPointsCard() {
    return GestureDetector(
      onTap: _navigateToWorkoutDetail,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 62,
                  height: 62,
                  child: CustomPaint(
                    painter: AntiClockwiseGaugePainter(
                      progress: 0.64,
                      strokeWidth: 6,
                      trackColor: AppColors.gaugeTrack,
                      progressColor: AppColors.gaugeGreen,
                    ),
                    child: const Center(
                      child: Text(
                        '64%',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textDark,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Weekly points',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textGrey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Text(
                          '1544',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textDark,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F8E9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.arrow_drop_up,
                                size: 14,
                                color: AppColors.gaugeGreen,
                              ),
                              Text(
                                '6%',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.gaugeGreen,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_horiz, color: AppColors.textGrey),
              ],
            ),
            const SizedBox(height: 20),

            // Graph Container with outer border
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF9F9FB),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.chartBorder, width: 1.2),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: CustomPaint(
                      painter: WaveChartPainter(
                        points: [0.35, 0.45, 0.28, 0.58, 0.38, 0.72, 0.52],
                        activeDotIndex: 4,
                        chartColor: AppColors.chartLine,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'S',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textGrey,
                        ),
                      ),
                      Text(
                        'M',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textGrey,
                        ),
                      ),
                      Text(
                        'T',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textGrey,
                        ),
                      ),
                      Text(
                        'W',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textGrey,
                        ),
                      ),
                      Text(
                        'T',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textGrey,
                        ),
                      ),
                      Text(
                        'F',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textGrey,
                        ),
                      ),
                      Text(
                        'S',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ------------------------------------------------------------
/// SCREEN 2: WORKOUT DETAIL (REFINED TO EXACT DESIGN)
/// ------------------------------------------------------------
class WorkoutDetailScreen extends StatefulWidget {
  const WorkoutDetailScreen({super.key});

  @override
  State<WorkoutDetailScreen> createState() => _WorkoutDetailScreenState();
}

class _WorkoutDetailScreenState extends State<WorkoutDetailScreen> {
  bool _isRunning = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. App Bar
              _buildTopBar(context),
              const SizedBox(height: 24),

              // 2. Workout title & Bar equalizer
              _buildWorkoutHeader(),
              const SizedBox(height: 22),

              // 3. Exercise 1/8 Card
              _buildRunningExerciseCard(),
              const SizedBox(height: 18),

              // 4. Exercise 2/8 Bench Press Card
              _buildBenchPressCard(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            width: 46,
            height: 46,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back,
              size: 20,
              color: AppColors.textDark,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(26),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.star_border_rounded,
                size: 21,
                color: AppColors.textDark,
              ),
              SizedBox(width: 16),
              Icon(Icons.edit_outlined, size: 19, color: AppColors.textDark),
              SizedBox(width: 16),
              Icon(Icons.more_horiz, size: 20, color: AppColors.textDark),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWorkoutHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: const BoxDecoration(
            color: Color(0xFFC7EAF8),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.fitness_center_rounded,
            size: 20,
            color: Color(0xFF2FA0C9),
          ),
        ),
        const SizedBox(width: 14),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Workout',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.textGrey,
              ),
            ),
            SizedBox(height: 2),
            Text(
              '90 min',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: AppColors.textDark,
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        const Spacer(),
        // Equalizer Bars: Bar 4 has a green accent cap
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildEqualizerBar(height: 18, isAccent: false),
            _buildEqualizerBar(height: 28, isAccent: false),
            _buildEqualizerBar(height: 14, isAccent: false),
            _buildEqualizerBar(height: 34, isAccent: true),
            _buildEqualizerBar(height: 24, isAccent: false),
          ],
        ),
      ],
    );
  }

  Widget _buildEqualizerBar({required double height, required bool isAccent}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: 4,
      height: height,
      decoration: BoxDecoration(
        color: isAccent ? const Color(0xFF75B836) : AppColors.textDark,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildRunningExerciseCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          // Header: Exercise 1/8 and Time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Exercise  ',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDark,
                      ),
                    ),
                    TextSpan(
                      text: '1/8',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textGrey,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                '1:29:59',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Layered Multi-Ring Dial
          SizedBox(
            width: 180,
            height: 180,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: const Size(180, 180),
                  painter: ExactConcentricDialPainter(),
                ),
                // Center Black Circle with White Running Figure
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: AppColors.textDark,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.directions_run_rounded,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
                // "Running 10km" Label positioned right under the icon
                const Positioned(
                  bottom: 24,
                  child: Column(
                    children: [
                      Text(
                        'Running',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textGrey,
                        ),
                      ),
                      SizedBox(height: 1),
                      Text(
                        '10km',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textDark,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // VO2 29  |  Capsule Indicator  |  Heart 98
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'VO₂ ',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textGrey,
                      ),
                    ),
                    TextSpan(
                      text: '29',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDark,
                      ),
                    ),
                  ],
                ),
              ),
              // Pagination Pill Indicator
              Row(
                children: [
                  Container(
                    width: 16,
                    height: 5,
                    decoration: BoxDecoration(
                      color: AppColors.textDark,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 5,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: Color(0xFFC7C7CC),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.favorite, size: 16, color: AppColors.heartPeach),
                  SizedBox(width: 4),
                  Text(
                    '98',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textDark,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 22),

          // STOP Button
          GestureDetector(
            onTap: () => setState(() => _isRunning = !_isRunning),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color: AppColors.stopBtnBg,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _isRunning
                        ? Icons.radio_button_checked
                        : Icons.play_circle_fill,
                    size: 16,
                    color: AppColors.textDark,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _isRunning ? 'STOP' : 'RESUME',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textDark,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBenchPressCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Exercise  ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDark,
                      ),
                    ),
                    TextSpan(
                      text: '2/8',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textGrey,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.more_horiz, color: AppColors.textGrey),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: Color(0xFFD4EFF9),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.fitness_center,
                  size: 18,
                  color: Color(0xFF3896BE),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bench Press',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textGrey,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      const Text(
                        '3/10',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textDark,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.arrow_drop_up,
                        size: 14,
                        color: AppColors.gaugeGreen,
                      ),
                      Text(
                        '6%',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: Colors.green.shade700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Time',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textGrey,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    '4min',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textDark,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 14),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300, width: 1.2),
                ),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  size: 20,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// ------------------------------------------------------------
/// CUSTOM PAINTERS
/// ------------------------------------------------------------

/// Anti-Clockwise circular gauge (Screen 1)
class AntiClockwiseGaugePainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color trackColor;
  final Color progressColor;

  AntiClockwiseGaugePainter({
    required this.progress,
    required this.strokeWidth,
    required this.trackColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final bgPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius, bgPaint);

    final fgPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    const startAngle = -math.pi / 2;
    final sweepAngle = -(2 * math.pi * progress);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      fgPaint,
    );
  }

  @override
  bool shouldRepaint(covariant AntiClockwiseGaugePainter oldDelegate) =>
      oldDelegate.progress != progress;
}

/// Smooth Bézier Line Chart (Screen 1)
class WaveChartPainter extends CustomPainter {
  final List<double> points;
  final int activeDotIndex;
  final Color chartColor;

  const WaveChartPainter({
    required this.points,
    required this.activeDotIndex,
    required this.chartColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (points.isEmpty) return;

    final dx = size.width / (points.length - 1);
    final offsets = <Offset>[];
    for (int i = 0; i < points.length; i++) {
      offsets.add(Offset(i * dx, size.height * (1.0 - points[i])));
    }

    final path = Path()..moveTo(offsets[0].dx, offsets[0].dy);
    for (int i = 0; i < offsets.length - 1; i++) {
      final p0 = offsets[i];
      final p1 = offsets[i + 1];
      final controlX = (p0.dx + p1.dx) / 2;
      path.cubicTo(controlX, p0.dy, controlX, p1.dy, p1.dx, p1.dy);
    }

    final linePaint = Paint()
      ..color = chartColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.4
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(path, linePaint);

    if (activeDotIndex >= 0 && activeDotIndex < offsets.length) {
      final activePoint = offsets[activeDotIndex];

      final whiteHalo = Paint()..color = Colors.white;
      canvas.drawCircle(activePoint, 6, whiteHalo);

      final outerRing = Paint()
        ..color = AppColors.textDark
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.8;
      canvas.drawCircle(activePoint, 5, outerRing);

      final centerDot = Paint()..color = AppColors.textDark;
      canvas.drawCircle(activePoint, 2.5, centerDot);
    }
  }

  @override
  bool shouldRepaint(covariant WaveChartPainter oldDelegate) => true;
}

/// Concentric Dial for Workout Screen (Screen 2 Exact Match)
class ExactConcentricDialPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    // 1. Full soft outer track ring
    final outerTrackPaint = Paint()
      ..color = AppColors.dialTrack
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    canvas.drawCircle(center, 72, outerTrackPaint);

    // 2. Green Arc on the upper right (around ~1:30 to 3:30 o'clock)
    final greenArcPaint = Paint()
      ..color = AppColors.dialGreen
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: 58),
      -0.35,
      0.55,
      false,
      greenArcPaint,
    );

    // Terminal green bead/dot at the top tip
    final topAngle = -0.35;
    final dotOffset = Offset(
      center.dx + 58 * math.cos(topAngle),
      center.dy + 58 * math.sin(topAngle),
    );
    canvas.drawCircle(dotOffset, 3.8, Paint()..color = AppColors.dialGreen);

    // 3. Orange / Amber arc from ~3:30 o'clock downwards to ~5:30 o'clock
    final orangeArcPaint = Paint()
      ..color = AppColors.dialOrange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: 58),
      0.35,
      1.65,
      false,
      orangeArcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant ExactConcentricDialPainter oldDelegate) => false;
}
