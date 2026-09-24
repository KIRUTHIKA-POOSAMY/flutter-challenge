import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildAvatar(),
        const SizedBox(width: 14),
        buildGreeting(),
        const Spacer(),
        buildNotificationButton(),
      ],
    );
  }

  Widget buildAvatar() {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        image: const DecorationImage(
          image: AssetImage('assets/images/avatar.jpg'),
          fit: BoxFit.cover,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x10FFFFFF),
            offset: Offset(-2, -2),
            blurRadius: 6,
          ),
          BoxShadow(
            color: Color(0x10000000),
            offset: Offset(2, 3),
            blurRadius: 6,
          ),
        ],
      ),
    );
  }

  Widget buildGreeting() {
    return const Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Hello, ',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: AppColors.primaryText,
            ),
          ),
          TextSpan(
            text: 'Sophia',
            style: TextStyle(fontSize: 24, color: AppColors.primaryText),
          ),
        ],
      ),
    );
  }

  Widget buildNotificationButton() {
    return Stack(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
          ),
          child: const Icon(Icons.notifications_none),
        ),
        Positioned(
          top: 6,
          right: 6,
          child: Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
