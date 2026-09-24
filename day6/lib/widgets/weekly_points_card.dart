import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'line_chart.dart';

class WeeklyPointsCard extends StatelessWidget {
  const WeeklyPointsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xFFD8D8D3), width: 1.3),
        boxShadow: const [
          BoxShadow(
            color: Color(0x18FFFFFF),
            offset: Offset(-4, -4),
            blurRadius: 12,
          ),
          BoxShadow(
            color: Color(0x12000000),
            offset: Offset(4, 6),
            blurRadius: 12,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildProgressRing(),
              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Weekly points',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryText,
                      ),
                    ),
                    const SizedBox(height: 4),

                    Row(
                      children: [
                        const Text(
                          '1544',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 8),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF2F2F0),
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(
                              color: const Color(0xFFE2E2DD),
                              width: 1.2,
                            ),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.arrow_drop_up,
                                color: Color(0xFF8CC63E),
                                size: 14,
                              ),
                              Text(
                                '6%',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF7BAE36),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const Icon(Icons.more_horiz, size: 20),
            ],
          ),

          const SizedBox(height: 8),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F0),
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: const Color(0xFFD8D8D3), width: 1.3),
              ),
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
              child: const LineChart(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProgressRing() {
    return const SizedBox(
      width: 74,
      height: 74,
      child: CustomPaint(
        painter: ProgressRingPainter(),
        child: Center(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '64',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
                ),
                TextSpan(
                  text: '%',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProgressRingPainter extends CustomPainter {
  const ProgressRingPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    const outerStroke = 7.5;
    const outerRadius = 36.0;

    final trackPaint = Paint()
      ..color = const Color(0xFFE8E8E3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = outerStroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, outerRadius, trackPaint);

    final progressPaint = Paint()
      ..color = const Color(0xFF8CC63E)
      ..style = PaintingStyle.stroke
      ..strokeWidth = outerStroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: outerRadius),
      -math.pi / 2,
      -(2 * math.pi * 0.64),
      false,
      progressPaint,
    );

    canvas.drawCircle(
      center,
      27,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 6,
    );

    canvas.drawCircle(center, 24, Paint()..color = const Color(0xFFF1F1EE));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
