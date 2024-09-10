import 'package:dio/dio.dart';
import 'package:posts_app/models/comment_model.dart';

class CommentService {
  final Dio dio;

  CommentService(this.dio);
  Future<List<CommentModel>> getPostsComments() async {
    try {
      Response response = await dio
          .get('https://jsonplaceholder.typicode.com/posts/1/comments');
      List<dynamic> posts = response.data;
      List<CommentModel> commentList = [];

      for (var post in posts) {
        CommentModel commentModel = CommentModel.fromJson(post);
        commentList.add(commentModel);
      }
      return commentList;
    } catch (e) {
      return [];
    }
  }
}
