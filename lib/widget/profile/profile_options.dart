import 'package:flutter/material.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: const Color(0xFFCF4D68),
          size: 40,
        ),
        const SizedBox(
          width: 17,
        ),
        Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
      ],
    );
  }
}
