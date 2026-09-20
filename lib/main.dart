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
      home: DayTwoScreen(),
    );
  }
}

class DayTwoScreen extends StatelessWidget {
  const DayTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---------------- 1. HEADER ----------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFFF7DDD4),
                          border: Border.all(color: Colors.white, width: 2.5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/profile.jpg',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                                  Icons.person,
                                  size: 28,
                                  color: Color(0xFFB25D48),
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      const Text(
                        "Hello, Sophia",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1E222B),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.notifications_none_rounded,
                          size: 24,
                          color: Color(0xFF1E222B),
                        ),
                      ),
                      Positioned(
                        right: 12,
                        top: 10,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Color(0xFFE94E4E),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 26),

              // ---------------- 2. MONTH SELECTOR ----------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.arrow_back,
                    size: 20,
                    color: Color(0xFF4A4E5A),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6DDD4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Feb 2025",
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2C303B),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: Color(0xFF4A4E5A),
                  ),
                ],
              ),

              const SizedBox(height: 22),

              // ---------------- 3. CALENDAR STRIP ----------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildDateItem("SUN", "1", isNumberHighlighted: true),
                  _buildDateItem("MON", "2", isNumberHighlighted: true),
                  _buildDateItem("TUE", "3"),

                  // WED + 4 Highlighted Together
                  Container(
                    width: 44,
                    padding: const EdgeInsets.symmetric(vertical: 9),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8DDD4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "WED",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFB25D48),
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          "4",
                          style: TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFB25D48),
                          ),
                        ),
                      ],
                    ),
                  ),

                  _buildDateItem("THR", "5"),
                  _buildDateItem("FRI", "6"),
                  _buildDateItem("SAT", "7"),
                ],
              ),

              const SizedBox(height: 26),

              // ---------------- 4. METRIC CARDS ----------------
              Row(
                children: [
                  Expanded(
                    child: _buildMetricCard(
                      title: "Time",
                      value: "1:30",
                      unit: "Hours",
                      icon: Icons.access_time_filled_rounded,
                      iconColor: const Color(0xFF4B9EB5),
                      cardBg: const Color(0xFFCEEEF6),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildMetricCard(
                      title: "Exercises",
                      value: "12/8",
                      unit: "Tasks",
                      icon: Icons.check_circle_rounded,
                      iconColor: const Color(0xFF7EAC47),
                      cardBg: const Color(0xFFD8F2BC),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // ---------------- 5. COMBINED WEEKLY POINTS & GRAPH CARD WITH BORDER ----------------
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(26),
                  border: Border.all(
                    color: const Color(0xFFE2E6EB),
                    width: 1.2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Top Row: Title + 3 dots menu
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Weekly points",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1E222B),
                          ),
                        ),
                        Icon(
                          Icons.more_horiz,
                          color: Color(0xFF1E222B),
                          size: 20,
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    // Middle Row: 64% gauge + 1544 + 6% chip
                    Row(
                      children: [
                        SizedBox(
                          width: 58,
                          height: 58,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircularProgressIndicator(
                                value: 0.64,
                                strokeWidth: 6.5,
                                backgroundColor: const Color(0xFFEEF2F5),
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Color(0xFF79BD45),
                                ),
                              ),
                              const Text(
                                "64%",
                                style: TextStyle(
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1E222B),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Text(
                          "1544",
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1E222B),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3F5F7),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.arrow_drop_up,
                                color: Color(0xFF79BD45),
                                size: 16,
                              ),
                              Text(
                                "6%",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF79BD45),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Inner Graph Container with border
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(14, 18, 14, 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F5F8),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFE4E9EE),
                          width: 1.0,
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 60,
                            width: double.infinity,
                            child: CustomPaint(painter: EnhancedWavePainter()),
                          ),
                          const SizedBox(height: 10),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "S",
                                style: TextStyle(
                                  fontSize: 10.5,
                                  color: Color(0xFF8C929E),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "M",
                                style: TextStyle(
                                  fontSize: 10.5,
                                  color: Color(0xFF8C929E),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "T",
                                style: TextStyle(
                                  fontSize: 10.5,
                                  color: Color(0xFF8C929E),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "W",
                                style: TextStyle(
                                  fontSize: 10.5,
                                  color: Color(0xFF8C929E),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "T",
                                style: TextStyle(
                                  fontSize: 10.5,
                                  color: Color(0xFF8C929E),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "F",
                                style: TextStyle(
                                  fontSize: 10.5,
                                  color: Color(0xFF8C929E),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "S",
                                style: TextStyle(
                                  fontSize: 10.5,
                                  color: Color(0xFF8C929E),
                                  fontWeight: FontWeight.w600,
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
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildDateItem(
    String day,
    String date, {
    bool isNumberHighlighted = false,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          day,
          style: const TextStyle(
            fontSize: 10.5,
            fontWeight: FontWeight.w600,
            color: Color(0xFF8C929E),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: isNumberHighlighted
                ? const Color(0xFFF8DDD4)
                : Colors.transparent,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            date,
            style: TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.w700,
              color: isNumberHighlighted
                  ? const Color(0xFFB25D48)
                  : const Color(0xFF1E222B),
            ),
          ),
        ),
      ],
    );
  }

  static Widget _buildMetricCard({
    required String title,
    required String value,
    required String unit,
    required IconData icon,
    required Color iconColor,
    required Color cardBg,
  }) {
    return Container(
      height: 155,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(24),
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
                  fontSize: 13.5,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2C303B),
                ),
              ),
              Icon(icon, size: 20, color: iconColor),
            ],
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1E222B),
            ),
          ),
          const SizedBox(height: 3),
          Text(
            unit,
            style: TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(0.42),
            ),
          ),
        ],
      ),
    );
  }
}

class EnhancedWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = const Color(0xFF64A3B6)
      ..strokeWidth = 2.4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();

    path.moveTo(0, size.height * 0.70);
    path.cubicTo(
      size.width * 0.08,
      size.height * 0.60,
      size.width * 0.15,
      size.height * 0.72,
      size.width * 0.28,
      size.height * 0.65,
    );
    path.cubicTo(
      size.width * 0.38,
      size.height * 0.58,
      size.width * 0.45,
      size.height * 0.75,
      size.width * 0.58,
      size.height * 0.28,
    );
    path.cubicTo(
      size.width * 0.63,
      size.height * 0.06,
      size.width * 0.72,
      size.height * 0.42,
      size.width * 0.84,
      size.height * 0.50,
    );
    path.cubicTo(
      size.width * 0.92,
      size.height * 0.55,
      size.width * 0.96,
      size.height * 0.52,
      size.width,
      size.height * 0.54,
    );

    canvas.drawPath(path, linePaint);

    final dotPaint = Paint()..color = const Color(0xFF1E222B);
    canvas.drawCircle(
      Offset(size.width * 0.53, size.height * 0.38),
      3.8,
      dotPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
