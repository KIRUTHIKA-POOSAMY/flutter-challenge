import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LineChart extends StatelessWidget {
  const LineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 112, // Fits inside WeeklyPointsCard
      child: Column(
        children: [
          Expanded(
            child: CustomPaint(
              size: Size.infinite,
              painter: LineChartPainter(),
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                7,
                (i) => Text(
                  ['S', 'M', 'T', 'W', 'T', 'F', 'S'][i],
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: const Color(0xFF8A8A8A),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LineChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const left = 0.0;
    const right = 0.0;
    const top = 6.0;
    const bottom = 6.0;

    final w = size.width - left - right;
    final h = size.height - top - bottom;

    final linePaint = Paint()
      ..color = const Color(0xFF3FA4D5)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final gridPaint = Paint()
      ..color =
          const Color(0xFFD2D2D2) // darker grey
      ..strokeWidth = 1.2;

    // Dotted vertical lines
    for (int i = 0; i < 7; i++) {
      final x = left + w * i / 6;
      for (double y = top; y < top + h; y += 8) {
        canvas.drawLine(Offset(x, y), Offset(x, y + 3), gridPaint);
      }
    }

    // Figma-like wave
    final points = [
      Offset(0, top + h * 0.60), // Start at left border
      Offset(left + w * 0.18, top + h * 0.50),
      Offset(left + w * 0.33, top + h * 0.66),
      Offset(left + w * 0.50, top + h * 0.42),
      Offset(left + w * 0.66, top + h * 0.82), // Deep valley
      Offset(left + w * 0.84, top + h * 0.18), // Friday peak
      Offset(size.width, top + h * 0.42), // End at right border
    ];

    final path = Path()..moveTo(points.first.dx, points.first.dy);

    for (int i = 0; i < points.length - 1; i++) {
      final p0 = i == 0 ? points[i] : points[i - 1];
      final p1 = points[i];
      final p2 = points[i + 1];
      final p3 = i + 2 < points.length ? points[i + 2] : p2;

      final cp1 = Offset(
        p1.dx + (p2.dx - p0.dx) / 6,
        p1.dy + (p2.dy - p0.dy) / 6,
      );

      final cp2 = Offset(
        p2.dx - (p3.dx - p1.dx) / 6,
        p2.dy - (p3.dy - p1.dy) / 6,
      );

      path.cubicTo(cp1.dx, cp1.dy, cp2.dx, cp2.dy, p2.dx, p2.dy);
    }

    canvas.drawPath(path, linePaint);

    // Highlight point exactly on the curve
    final metric = path.computeMetrics().first;
    final tangent = metric.getTangentForOffset(metric.length * 0.74)!;
    final highlight = tangent.position;

    canvas.drawCircle(highlight, 8, Paint()..color = Colors.white);

    canvas.drawCircle(highlight, 4.5, Paint()..color = Colors.black);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
