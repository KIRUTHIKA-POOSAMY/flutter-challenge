import 'dart:math' as math;

import 'package:flutter/material.dart';

void main() {
  runApp(const WorkoutTrackerApp());
}

class WorkoutTrackerApp extends StatelessWidget {
  const WorkoutTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFEBEFEF),
        fontFamily: 'sans-serif',
      ),
      home: const WorkoutTrackerScreen(),
    );
  }
}

class WorkoutTrackerScreen extends StatelessWidget {
  const WorkoutTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBEFEF),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenHeight = constraints.maxHeight;
            final isCompact = screenHeight < 720;
            final cardSpacing = isCompact ? 10.0 : 16.0;
            final gaugeSize = isCompact ? 165.0 : 190.0;

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 20,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- Top Navigation Header ---
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildCircleIconButton(Icons.arrow_back),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(28),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.star_border_rounded,
                                  size: 21,
                                  color: Colors.black87,
                                ),
                                SizedBox(width: 14),
                                Icon(
                                  Icons.edit_outlined,
                                  size: 19,
                                  color: Colors.black87,
                                ),
                                SizedBox(width: 14),
                                Icon(
                                  Icons.more_horiz_rounded,
                                  size: 21,
                                  color: Colors.black87,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: cardSpacing + 4),

                      // --- Workout Summary Bar ---
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 52,
                            height: 52,
                            decoration: const BoxDecoration(
                              color: Color(0xFFC7E2E8),
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.fitness_center_rounded,
                                color: Color(0xFF265D68),
                                size: 22,
                              ),
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
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF1E2124),
                                ),
                              ),
                              SizedBox(height: 1),
                              Text(
                                '90 min',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1E2124),
                                  letterSpacing: -0.5,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const WorkoutBarChart(),
                        ],
                      ),
                      SizedBox(height: cardSpacing),

                      // --- Primary Active Exercise Card (1/8) ---
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(isCompact ? 16 : 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Column(
                          children: [
                            // Header Row: Title & Stopwatch
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Exercise',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF1A1A1A),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 7,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF2F4F5),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Text(
                                        '1/8',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF70767C),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Text(
                                  '1:29:59',
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1A1A1A),
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: isCompact ? 14 : 18),

                            // Multi-Arc Running Ring Gauge
                            SizedBox(
                              width: gaugeSize,
                              height: gaugeSize,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CustomPaint(
                                    size: Size(gaugeSize, gaugeSize),
                                    painter: ExerciseGaugePainter(
                                      scale: gaugeSize / 190.0,
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: isCompact ? 20 : 23,
                                        backgroundColor: const Color(
                                          0xFF141414,
                                        ),
                                        child: const Icon(
                                          Icons.directions_run_rounded,
                                          color: Color(0xFFF6BEA7),
                                          size: 22,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      const Text(
                                        'Running',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF8B939A),
                                        ),
                                      ),
                                      const SizedBox(height: 1),
                                      const Text(
                                        '10km',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF111417),
                                          letterSpacing: -0.3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: isCompact ? 14 : 18),

                            // Metrics Row: VO2, Indicators & Heart Rate
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'VO₂ ',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '29',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 14,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Container(
                                      width: 4,
                                      height: 4,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFD4D8DC),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.favorite_rounded,
                                      color: Color(0xFFE59C87),
                                      size: 15,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      '98',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: isCompact ? 12 : 16),

                            // Stop Button
                            SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFF9C0A9),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.stop_circle_outlined,
                                      color: Colors.black87,
                                      size: 17,
                                    ),
                                    SizedBox(width: 7),
                                    Text(
                                      'STOP',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.8,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: cardSpacing),

                      // --- Secondary Exercise Card (2/8) ---
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Exercise',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF1A1A1A),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF2F4F5),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Text(
                                        '2/8',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF70767C),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Icon(
                                  Icons.more_horiz_rounded,
                                  color: Colors.black87,
                                  size: 18,
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Container(
                                  width: 42,
                                  height: 42,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFD3E7ED),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.fitness_center_rounded,
                                    color: Color(0xFF386470),
                                    size: 19,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Bench Press',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF8B939A),
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Row(
                                      children: [
                                        const Text(
                                          '3/10',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF1A1A1A),
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 4,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFF2F4F5),
                                            borderRadius: BorderRadius.circular(
                                              6,
                                            ),
                                          ),
                                          child: const Row(
                                            children: [
                                              Icon(
                                                Icons.arrow_drop_up,
                                                size: 12,
                                                color: Color(0xFF88B337),
                                              ),
                                              Text(
                                                '6%',
                                                style: TextStyle(
                                                  fontSize: 9,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF636C73),
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
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Time',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF8B939A),
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      '4min',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF1A1A1A),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 14),
                                Container(
                                  width: 38,
                                  height: 38,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(0xFF222629),
                                      width: 1.2,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.play_arrow_rounded,
                                    color: Color(0xFF1A1A1A),
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  static Widget _buildCircleIconButton(IconData icon) {
    return Container(
      width: 42,
      height: 42,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Center(child: Icon(icon, color: Colors.black87, size: 19)),
    );
  }
}

class WorkoutBarChart extends StatelessWidget {
  const WorkoutBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    const bars = [
      {'height': 15.0, 'color': Color(0xFF1A1A1A), 'hasDot': false},
      {'height': 21.0, 'color': Color(0xFF1A1A1A), 'hasDot': false},
      {'height': 17.0, 'color': Color(0xFF1A1A1A), 'hasDot': false},
      {'height': 27.0, 'color': Color(0xFF90B83E), 'hasDot': true},
      {'height': 19.0, 'color': Color(0xFF90B83E), 'hasDot': false},
      {'height': 13.0, 'color': Color(0xFF90B83E), 'hasDot': false},
      {'height': 20.0, 'color': Color(0xFF1A1A1A), 'hasDot': false},
    ];

    return SizedBox(
      height: 36,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: bars.map((b) {
          final height = b['height'] as double;
          final color = b['color'] as Color;
          final hasDot = b['hasDot'] as bool;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (hasDot) ...[
                  Container(
                    width: 3.5,
                    height: 3.5,
                    decoration: const BoxDecoration(
                      color: Color(0xFF90B83E),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(height: 2),
                ],
                Container(
                  width: 3.5,
                  height: height,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

/// Fully Aligned Concentric Gauge Painter
class ExerciseGaugePainter extends CustomPainter {
  final double scale;
  const ExerciseGaugePainter({this.scale = 1.0});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final double innerRadius = 57.0 * scale;
    final double outerRadius = 71.0 * scale;
    final double strokeWidth = 8.5 * scale;

    // ------------------------------------------------------------------------
    // 1. Concentric Background Tracks (Thin Gray Channels)
    // ------------------------------------------------------------------------
    final bgGuidePaint = Paint()
      ..color = const Color(0xFFEFF3F6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, innerRadius, bgGuidePaint);
    canvas.drawCircle(center, outerRadius, bgGuidePaint);

    // ------------------------------------------------------------------------
    // 2. Outer Light Grey Arc (Left side from 6:30 sweeping counter-clockwise to 11:30)
    // ------------------------------------------------------------------------
    final outerGreyPaint = Paint()
      ..color = const Color(0xFFE2E7EB)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: outerRadius),
      math.pi * 0.55, // ~5:30 position
      math.pi * 0.88, // Sweeps around left up to ~11:30
      false,
      outerGreyPaint,
    );

    // ------------------------------------------------------------------------
    // 3. Inner Light Blue Arc (Starts from ~4:30 and curves over top to ~10:00)
    // ------------------------------------------------------------------------
    final innerBluePaint = Paint()
      ..color = const Color(0xFFC7E3ED)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Sweeps from 4:30 (+40°) anti-clockwise over top to 10:00 (-140°)
    const double innerStart = math.pi * 0.22;
    const double innerSweep = -math.pi * 1.00;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: innerRadius),
      innerStart,
      innerSweep,
      false,
      innerBluePaint,
    );

    // ------------------------------------------------------------------------
    // 4. Outer Accent Arc: Lime-Green to Warm Amber-Orange
    // Starts at 2:00 (-15°) and sweeps down along the right to 5:00 (+65°)
    // ------------------------------------------------------------------------
    const double outerStart = -math.pi * 0.08;
    const double outerSweep = math.pi * 0.44;

    final Rect outerRect = Rect.fromCircle(center: center, radius: outerRadius);

    final sweepGradient = const SweepGradient(
      colors: [
        Color(0xFF86B533), // Leaf / Lime Green
        Color(0xFFAABF2B), // Mid olive
        Color(0xFFDE7E12), // Warm golden orange
      ],
      stops: [0.0, 0.20, 0.45],
      transform: GradientRotation(-math.pi * 0.10),
    );

    final outerAccentPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..shader = sweepGradient.createShader(outerRect);

    canvas.drawArc(outerRect, outerStart, outerSweep, false, outerAccentPaint);

    // ------------------------------------------------------------------------
    // 5. Standalone Green Marker Dot (at ~1:30 position above the gradient arc)
    // ------------------------------------------------------------------------
    const double dotAngle = -math.pi * 0.16; // ~1:30 (-29°)
    final dotCenter = Offset(
      center.dx + outerRadius * math.cos(dotAngle),
      center.dy + outerRadius * math.sin(dotAngle),
    );

    final dotPaint = Paint()
      ..color = const Color(0xFF86B533)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(dotCenter, 4.2 * scale, dotPaint);
  }

  @override
  bool shouldRepaint(covariant ExerciseGaugePainter oldDelegate) =>
      oldDelegate.scale != scale;
}
