class PostModel {
  final String title;
  final String info;

  PostModel({
    required this.title,
    required this.info,
  });

  factory PostModel.fromJson(json) {
    return PostModel(
      title: json['title'],
      info: json['info'],
    );
  }
}
