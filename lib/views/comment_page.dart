import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:posts_app/models/comment_model.dart';
import 'package:posts_app/services/comment_services.dart';
import 'package:posts_app/widget/commentWidget/commet_widget.dart';

class CommentPage extends StatelessWidget {
  final int postId;

  const CommentPage({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff222337),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff222337),
        title: Text(
          'Comments for Post $postId',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: FutureBuilder<List<CommentModel>>(
        future: CommentService(Dio()).getPostComments(postId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
                child: Text(
              'Error fetching comments',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: Text(
              'No comments found',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final comment = snapshot.data![index];
              return CommentWidget(
                name: comment.name,
                email: comment.email,
                comment: comment.comment,
              );
            },
          );
        },
      ),
    );
  }
}
