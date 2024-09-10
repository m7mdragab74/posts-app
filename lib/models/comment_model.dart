class CommentModel {
  final int commentId;
  final int postId;
  final String name;
  final String email;
  final String comment;

  CommentModel(
      {required this.commentId,
      required this.comment,
      required this.email,
      required this.name,
      required this.postId});

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      commentId: json['id'],
      name: json['name'],
      email: json['email'],
      comment: json['body'],
      postId: json['postId'],
    );
  }
}
