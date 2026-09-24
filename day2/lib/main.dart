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
      backgroundColor: const Color(0xFFF7F8FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ---------------- HEADER ----------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFFFDDD2),
                            border: Border.all(color: Colors.white, width: 2.5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/profile.jpg',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.person,
                                  size: 30,
                                  color: Color(0xFFBD5E48),
                                );
                              },
                            ),
                          ),
                        ),

                        const SizedBox(width: 14),

                        const Text(
                          "Hello, Sophia",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1F2430),
                          ),
                        ),
                      ],
                    ),

                    // Notification
                    Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.notifications_none_rounded,
                            size: 24,
                            color: Colors.black87,
                          ),
                        ),

                        Positioned(
                          right: 12,
                          top: 10,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFF5252),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                // ---------------- MONTH ----------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.arrow_back,
                      size: 20,
                      color: Colors.black54,
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7E2DA),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Feb 2025",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2D3142),
                        ),
                      ),
                    ),

                    const Icon(
                      Icons.arrow_forward,
                      size: 20,
                      color: Colors.black54,
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                // ---------------- CALENDAR ----------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    dateColumn("SUN", "1"),
                    dateColumn("MON", "2"),
                    dateColumn("TUE", "3"),

                    // WEDNESDAY + 4 HIGHLIGHT
                    Container(
                      width: 48,
                      height: 72,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFC6B0),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WED",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "4",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    dateColumn("THR", "5"),
                    dateColumn("FRI", "6"),
                    dateColumn("SAT", "7"),
                  ],
                ),

                const SizedBox(height: 28),

                // ---------------- TIME + EXERCISES ----------------
                Row(
                  children: [
                    // TIME CARD
                    Expanded(
                      child: Container(
                        height: 155,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFC9EAF4),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Time",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Icon(
                                  Icons.access_time,
                                  size: 20,
                                  color: Color(0xFF4A9DB5),
                                ),
                              ],
                            ),

                            const Spacer(),

                            const Text(
                              "1:30",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            const SizedBox(height: 4),

                            const Text(
                              "Hours",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    // EXERCISES CARD
                    Expanded(
                      child: Container(
                        height: 155,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD9EFAE),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Exercises",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Icon(
                                  Icons.remove_red_eye_outlined,
                                  size: 20,
                                  color: Color(0xFF8BB84A),
                                ),
                              ],
                            ),

                            const Spacer(),

                            const Text(
                              "12/8",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            const SizedBox(height: 4),

                            const Text(
                              "Tasks",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // ---------------- WEEKLY POINTS ----------------
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TITLE
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Weekly points",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(Icons.more_horiz, size: 22),
                        ],
                      ),

                      const SizedBox(height: 14),

                      // SCORE
                      Row(
                        children: [
                          // 64% CIRCLE
                          SizedBox(
                            width: 78,
                            height: 78,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width: 72,
                                  height: 72,
                                  child: CircularProgressIndicator(
                                    value: 0.64,
                                    strokeWidth: 8,
                                    backgroundColor: const Color(0xFFE9ECEF),
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                          Color(0xFF8BC34A),
                                        ),
                                  ),
                                ),

                                const Text(
                                  "64%",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 18),

                          // 1544
                          const Text(
                            "1544",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          const SizedBox(width: 10),

                          // 6%
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 7,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.arrow_drop_up,
                                  size: 16,
                                  color: Color(0xFF8BB84A),
                                ),
                                Text(
                                  "6%",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFF7EAA38),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // GRAPH
                      SizedBox(
                        height: 80,
                        width: double.infinity,
                        child: CustomPaint(painter: WeeklyGraphPainter()),
                      ),

                      // DAYS
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("S", style: TextStyle(fontSize: 11)),
                          Text("M", style: TextStyle(fontSize: 11)),
                          Text("T", style: TextStyle(fontSize: 11)),
                          Text("W", style: TextStyle(fontSize: 11)),
                          Text("T", style: TextStyle(fontSize: 11)),
                          Text("F", style: TextStyle(fontSize: 11)),
                          Text("S", style: TextStyle(fontSize: 11)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ---------------- DATE COLUMN ----------------
  static Widget dateColumn(String day, String date) {
    return SizedBox(
      width: 36,
      height: 72,
      child: Column(
        children: [
          Text(
            day,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
          ),

          const SizedBox(height: 15),

          Text(
            date,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

// ---------------- WEEKLY GRAPH ----------------
class WeeklyGraphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF4A9DB5)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final path = Path();

    path.moveTo(0, 48);

    path.quadraticBezierTo(size.width * 0.08, 30, size.width * 0.17, 45);

    path.quadraticBezierTo(size.width * 0.27, 65, size.width * 0.38, 38);

    path.quadraticBezierTo(size.width * 0.48, 25, size.width * 0.58, 48);

    path.quadraticBezierTo(size.width * 0.67, 70, size.width * 0.78, 12);

    path.quadraticBezierTo(size.width * 0.88, 0, size.width, 22);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
