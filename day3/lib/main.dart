import 'dart:math' as math;

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DayThreeScreen(),
    );
  }
}

class DayThreeScreen extends StatelessWidget {
  const DayThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F3F6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---------------- 1. APP BAR ----------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Circular Back Button
                  Container(
                    width: 46,
                    height: 46,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 20,
                      color: Color(0xFF1E222B),
                    ),
                  ),

                  // Actions Pill (Star, Pencil, More)
                  Container(
                    height: 46,
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star_border_rounded,
                          size: 20,
                          color: Color(0xFF1E222B),
                        ),
                        SizedBox(width: 14),
                        Icon(
                          Icons.edit_outlined,
                          size: 18,
                          color: Color(0xFF1E222B),
                        ),
                        SizedBox(width: 14),
                        Icon(
                          Icons.more_horiz,
                          size: 20,
                          color: Color(0xFF1E222B),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // ---------------- 2. WORKOUT 90 MIN ROW ----------------
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Muscle Icon Avatar
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color(0xFFD3EFF7),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.fitness_center_rounded,
                      color: Color(0xFF3898B2),
                      size: 23,
                    ),
                  ),
                  const SizedBox(width: 14),

                  // Title & Duration
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Workout",
                        style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1E222B),
                        ),
                      ),
                      SizedBox(height: 1),
                      Text(
                        "90 min",
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF1E222B),
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  // Activity Equalizer Bars
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _buildBar(height: 14, color: const Color(0xFF1E222B)),
                      const SizedBox(width: 4),
                      _buildBar(height: 24, color: const Color(0xFF1E222B)),
                      const SizedBox(width: 4),
                      _buildBar(height: 24, color: const Color(0xFF1E222B)),
                      const SizedBox(width: 4),
                      // Tall Accent Bar with Dot
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 3.5,
                            height: 3.5,
                            decoration: const BoxDecoration(
                              color: Color(0xFF8CC152),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(height: 3),
                          _buildBar(height: 28, color: const Color(0xFF8CC152)),
                        ],
                      ),
                      const SizedBox(width: 4),
                      // Mid Accent Bar with Dot
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 3.5,
                            height: 3.5,
                            decoration: const BoxDecoration(
                              color: Color(0xFF8CC152),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(height: 3),
                          _buildBar(height: 18, color: const Color(0xFF8CC152)),
                        ],
                      ),
                      const SizedBox(width: 4),
                      _buildBar(height: 20, color: const Color(0xFF1E222B)),
                      const SizedBox(width: 4),
                      _buildBar(height: 26, color: const Color(0xFF1E222B)),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // ---------------- 3. EXERCISE 1/8 MAIN CARD ----------------
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 22, 20, 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: const Color(0xFFE7ECF0),
                    width: 1.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.015),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Exercise + 1/8 Pill & Timer
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Exercise",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF1E222B),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF3F5F7),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                "1/8",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF1E222B),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          "1:29:59",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF1E222B),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Multi-Ring Activity Concentric Gauge
                    SizedBox(
                      width: 195,
                      height: 195,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomPaint(
                            size: const Size(195, 195),
                            painter: ActivityGaugePainter(),
                          ),
                          // Central dark badge with runner icon & 10km readout
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 44,
                                height: 44,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF161922),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.directions_run_rounded,
                                  color: Color(0xFFFFD5CA),
                                  size: 22,
                                ),
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                "Running",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF8C929E),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 1),
                              const Text(
                                "10km",
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF1E222B),
                                  letterSpacing: -0.5,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 26),

                    // ---------------- 4. VITALS ROW (Far Left & Far Right) ----------------
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // FAR LEFT: VO2 29
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(color: Color(0xFF1E222B)),
                              children: [
                                TextSpan(
                                  text: "VO₂ ",
                                  style: TextStyle(
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF6E7480),
                                  ),
                                ),
                                TextSpan(
                                  text: "29",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // DEAD CENTER: Small indicator capsule
                          Container(
                            width: 14,
                            height: 3.5,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1E222B),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),

                          // FAR RIGHT: Heart Icon + 98
                          const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.favorite_rounded,
                                color: Color(0xFFFFB2A2),
                                size: 16,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "98",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF1E222B),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 22),

                    // ---------------- 5. STOP BUTTON ----------------
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF9C7B2),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.radio_button_checked,
                            color: Color(0xFF1E222B),
                            size: 16,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "STOP",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF1E222B),
                              letterSpacing: 1.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildBar({required double height, required Color color}) {
    return Container(
      width: 3.5,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}

// ---------------- ACCURATE MULTI-RING CONCENTRIC PAINTER ----------------
class ActivityGaugePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    // ---------------- 1. FAINT BASE GUIDE RINGS ----------------
    final rOuterGuide = size.width * 0.44;
    final faintBasePaint = Paint()
      ..color = const Color(0xFFF1F4F7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round;

    // Outer subtle guide track
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: rOuterGuide),
      -math.pi * 0.70,
      math.pi * 1.30,
      false,
      faintBasePaint,
    );

    // Middle complete subtle guide track
    final rMidGuide = size.width * 0.395;
    canvas.drawCircle(center, rMidGuide, faintBasePaint);

    // ---------------- 2. INNER POWDER-CYAN ARC ----------------
    final rInnerCyan = size.width * 0.355;
    final innerCyanPaint = Paint()
      ..color = const Color(0xFFD0EFF6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round;

    // Cyan arc running from top-right around left to bottom
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: rInnerCyan),
      -math.pi * 0.50,
      math.pi * 1.55,
      false,
      innerCyanPaint,
    );

    // ---------------- 3. OUTER GRADIENT ARC (Green -> Yellow -> Orange) ----------------
    final rActive = size.width * 0.44;
    final rActiveRect = Rect.fromCircle(center: center, radius: rActive);

    final outerGradientPaint = Paint()
      ..shader = const SweepGradient(
        startAngle: -math.pi * 0.16,
        endAngle: math.pi * 0.46,
        colors: [
          Color(0xFF8CC152), // Bright lime green
          Color(0xFFB5C538), // Transition yellow-green
          Color(0xFFE28723), // Warm ochre orange
        ],
        stops: [0.0, 0.45, 1.0],
      ).createShader(rActiveRect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7.5
      ..strokeCap = StrokeCap.round;

    // Active arc sweeping down the right edge
    canvas.drawArc(
      rActiveRect,
      -math.pi * 0.14,
      math.pi * 0.52,
      false,
      outerGradientPaint,
    );

    // ---------------- 4. DETACHED GREEN DOT ----------------
    const dotAngle = -math.pi * 0.22;
    final dotX = center.dx + rActive * math.cos(dotAngle);
    final dotY = center.dy + rActive * math.sin(dotAngle);
    final dotPaint = Paint()
      ..color = const Color(0xFF8CC152)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(dotX, dotY), 4.5, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
