import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:posts_app/models/post_model.dart';

class PostService {
  final Dio dio;

  PostService(this.dio);

  Future<List<PostModel>> getPosts() async {
    try {
      Response response =
          await dio.get('https://jsonplaceholder.typicode.com/posts');
      List<dynamic> postsData = response.data;

      return postsData.map((data) => PostModel.fromJson(data)).toList();
    } catch (e) {
      debugPrint("Error fetching posts: $e");
      return [];
    }
  }
}
