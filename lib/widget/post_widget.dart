import 'package:flutter/material.dart';
import 'package:posts_app/models/post_model.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
    required this.postModel,
  });

  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13),
      child: Container(
        padding: const EdgeInsets.all(7),
        height: 270,
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
              postModel.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              postModel.body,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
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
