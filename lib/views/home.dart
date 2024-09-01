import 'package:flutter/material.dart';
import 'package:posts_app/models/post_model.dart';
import 'package:posts_app/services/post_services.dart';
import 'package:posts_app/widget/post_widget.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<PostModel>> postsFuture;

  @override
  void initState() {
    super.initState();
    PostService postService = PostService(Dio());
    postsFuture = postService.getPostsTitleAndInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Posts Threads',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: FutureBuilder<List<PostModel>>(
        future: postsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return PostWidget(postModel: snapshot.data![index]);
              },
            );
          } else {
            return const Center(child: Text('No posts available.'));
          }
        },
      ),
    );
  }
}
