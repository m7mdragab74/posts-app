import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  final String name;
  final String email;
  final String comment;

  const CommentWidget({
    super.key,
    required this.name,
    required this.email,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: const Color(0xff323243),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xff323243)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              email,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              comment,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
