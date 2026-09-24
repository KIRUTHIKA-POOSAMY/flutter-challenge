import 'package:flutter/material.dart';

//import '../theme/app_colors.dart';

class MetricCard extends StatelessWidget {
  const MetricCard({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.backgroundColor,
    required this.icon,
    this.onTap,
  });

  final String title;
  final String value;
  final String subtitle;
  final Color backgroundColor;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 126,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                title == 'Time'
                    ? const Icon(
                        Icons.access_time_filled,
                        size: 20,
                        color: Color(0xFF3A99C1), // Blue filled clock
                      )
                    : const Icon(
                        Icons.remove_red_eye,
                        size: 20,
                        color: Color(0xFF6F9F2A), // Darker green eye
                      ),
              ],
            ),
            const Spacer(),
            Text(
              value,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            Text(subtitle),
          ],
        ),
      ),
    );
  }
}
