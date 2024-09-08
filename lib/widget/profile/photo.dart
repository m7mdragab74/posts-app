import 'package:flutter/material.dart';

class BuildProfilePicture extends StatelessWidget {
  const BuildProfilePicture({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          const CircleAvatar(
            radius: 70,
            backgroundImage:
                NetworkImage("https://avatar.iran.liara.run/public/31"),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(4),
              child: const Icon(
                Icons.edit,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
