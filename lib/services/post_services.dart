import 'package:dio/dio.dart';
import 'package:posts_app/models/post_model.dart';

class PostService {
  final Dio dio;

  PostService(this.dio);

  Future<List<PostModel>> getPostsTitleAndInfo() async {
    try {
      Response response =
          await dio.get('https://jsonplaceholder.typicode.com/posts');
      List<dynamic> posts = response.data;
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
