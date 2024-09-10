import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:posts_app/models/comment_model.dart';

class CommentService {
  final Dio dio;

  CommentService(this.dio);

  Future<List<CommentModel>> getPostComments(int postId) async {
    try {
      Response response = await dio
          .get('https://jsonplaceholder.typicode.com/posts/$postId/comments');
      List<dynamic> commentsData = response.data;

      return commentsData.map((data) => CommentModel.fromJson(data)).toList();
    } catch (e) {
      debugPrint("Error fetching comments: $e");
      return [];
    }
  }
}
