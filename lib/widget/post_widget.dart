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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            postModel.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
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
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
