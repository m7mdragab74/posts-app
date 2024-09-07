import 'package:flutter/material.dart';
import 'package:posts_app/views/sign_up_page.dart';

void main() {
  runApp(PostsApp());
}

class PostsApp extends StatelessWidget {
  const PostsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}
