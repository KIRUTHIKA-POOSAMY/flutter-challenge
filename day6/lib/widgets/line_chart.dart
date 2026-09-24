import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class LineChart extends StatelessWidget {
  const LineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: WeeklyChartPainter(), child: Container());
  }
}

class WeeklyChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const labels = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

    final chartHeight = size.height - 30;
    final step = size.width / 6;

    // Matches the reference wave shape
    final points = [
      Offset(0, chartHeight * 0.72),
      Offset(step, chartHeight * 0.60),
      Offset(step * 2, chartHeight * 0.72),
      Offset(step * 3, chartHeight * 0.28),
      Offset(step * 4, chartHeight * 0.08), // peak
      Offset(step * 5, chartHeight * 0.40),
      Offset(step * 6, chartHeight * 0.46),
    ];

    // Vertical guide lines
    final guidePaint = Paint()
      ..color = const Color(0xFFE5E5E1)
      ..strokeWidth = 1;

    for (final point in points) {
      canvas.drawLine(
        Offset(point.dx, 8),
        Offset(point.dx, chartHeight),
        guidePaint,
      );
    }

    // Smooth Figma-like curve
    final path = Path()..moveTo(points.first.dx, points.first.dy);

    for (int i = 0; i < points.length - 1; i++) {
      final current = points[i];
      final next = points[i + 1];

      path.cubicTo(
        current.dx + step * 0.28,
        current.dy,
        next.dx - step * 0.28,
        next.dy,
        next.dx,
        next.dy,
      );
    }

    final linePaint = Paint()
      ..color = AppColors.chartBlue
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path, linePaint);

    // Black point with white border
    final activePoint = points[4];

    canvas.drawCircle(activePoint, 8, Paint()..color = Colors.white);

    canvas.drawCircle(activePoint, 5, Paint()..color = Colors.black);

    // Bottom labels
    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    for (int i = 0; i < labels.length; i++) {
      textPainter.text = TextSpan(
        text: labels[i],
        style: const TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w500,
          color: AppColors.secondaryText,
        ),
      );

      textPainter.layout();

      textPainter.paint(
        canvas,
        Offset(
          points[i].dx - textPainter.width / 2,
          size.height - textPainter.height - 8,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
