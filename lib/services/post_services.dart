import 'package:dio/dio.dart';
import 'package:posts_app/models/post_model.dart';

class PostService {
  final Dio dio;

  PostService(this.dio);

  Future<List<PostModel>> getPostsTitleAndInfo() async {
    try {
      Response response = await dio.get('path');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> posts = jsonData['posts'];
      List<PostModel> postList = [];

      for (var post in posts) {
        PostModel postModel = PostModel.fromJson(post);
        postList.add(postModel);
      }
      return postList;
    } catch (e) {
      return [];
    }
  }
}
