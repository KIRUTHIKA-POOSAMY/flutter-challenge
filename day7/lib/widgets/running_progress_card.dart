import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

import 'dart:math' as math;

class RunningProgressCard extends StatelessWidget {
  const RunningProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 355, // Figma-like height
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        children: [
          buildHeader(),

          Expanded(child: Center(child: buildProgressArea())),

          buildBottomStats(),

          const SizedBox(height: 6),

          buildStopButton(),
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Row(
      children: [
        Text(
          'Exercise',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: const Color(0xFFF3F3F0),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            '1/8',
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Spacer(),
        Text(
          '1:29:59',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget buildProgressArea() {
    return SizedBox(
      width: 200,
      height: 200,
      child: CustomPaint(
        painter: RunningGaugePainter(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.directions_run,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "Running",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: const Color(0xFF666666),
                ),
              ),
              Text(
                "10km",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBottomStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'VO₂',
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.black54),
            ),
            const SizedBox(width: 2),
            Text(
              '29',
              style: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),

        Row(
          children: [
            Container(
              width: 5,
              height: 5,
              decoration: const BoxDecoration(
                color: Color(0xFFD5D5D2),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
            Container(
              width: 16,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 6),
            Container(
              width: 5,
              height: 5,
              decoration: const BoxDecoration(
                color: Color(0xFFD5D5D2),
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.favorite, color: Color(0xFFE8A388), size: 16),
            const SizedBox(width: 4),
            Text(
              '98',
              style: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildStopButton() {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 1.6),
          ),
          child: Center(
            child: Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ),
        ),
        label: Text(
          "STOP",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFF2C0A8),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}

class RunningGaugePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    const innerR = 58.0;
    const middleR = 68.0;
    const outerR = 78.0;
    const stroke = 7.5;

    Paint ring(Color color) => Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;

    // ---------------- INNER RING ----------------
    // Blue base
    canvas.drawCircle(center, innerR, ring(const Color(0xFFCBEAF6)));

    // Grey from 12:00 → 3:17
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: innerR),
      -math.pi / 2, // 12:00
      98.5 * math.pi / 180, // 3:17
      false,
      ring(const Color(0xFFE8E8E4)),
    );

    // ---------------- MIDDLE RING ----------------
    canvas.drawCircle(center, middleR, ring(const Color(0xFFE8E8E4)));

    // ---------------- OUTER GREY ----------------
    // 6:30 → 8:40
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: outerR),
      105 * math.pi / 180,
      65 * math.pi / 180,
      false,
      ring(const Color(0xFFE8E8E4)),
    );

    // ---------- OUTER COLOURED ARC ----------
    // 5:25 → 2:12

    const startDeg = 72.5;
    const endDeg = -18.0;
    const segments = 60;

    for (int i = 0; i < segments; i++) {
      final t1 = i / segments;
      final t2 = (i + 1) / segments;

      final a1 = (startDeg + (endDeg - startDeg) * t1) * math.pi / 180;
      final a2 = (startDeg + (endDeg - startDeg) * t2) * math.pi / 180;

      Color color;

      if (t1 < 0.25) {
        color = Color.lerp(
          const Color(0xFFF39A1E), // Orange
          const Color(0xFFE4B52A), // Yellow
          t1 / 0.55,
        )!;
      } else {
        color = Color.lerp(
          const Color(0xFFE4B52A), // Yellow
          const Color(0xFF98C73C), // Green
          (t1 - 0.55) / 0.45,
        )!;
      }

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: outerR),
        a1,
        a2 - a1,
        false,
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = stroke
          ..strokeCap = StrokeCap.round,
      );
    }

    // ---------- GREEN DOT ----------
    final dotAngle = -30 * math.pi / 180; // 2:10

    final dot = Offset(
      center.dx + outerR * math.cos(dotAngle),
      center.dy + outerR * math.sin(dotAngle),
    );

    canvas.drawCircle(dot, 5, Paint()..color = const Color(0xFF98C73C));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
