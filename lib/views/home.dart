import 'package:flutter/material.dart';
import 'package:posts_app/models/post_model.dart';
import 'package:posts_app/services/post_services.dart';
import 'package:posts_app/views/fav_page.dart';
import 'package:posts_app/views/profile_page.dart';
import 'package:posts_app/widget/customNav/custom_nav_bar.dart';
import 'package:posts_app/widget/postwidget/post_widget.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const primaryColor = Colors.blue;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  late Future<List<PostModel>> postsFuture;
  @override
  void initState() {
    super.initState();
    PostService postService = PostService(Dio());
    postsFuture = postService.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff222337),
      bottomNavigationBar: CustomBottomNavBar(
        pages: const [
          HomePage(),
          FavPage(),
          ProfilePage(),
        ],
        color: HomePage.primaryColor,
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xff222337),
        centerTitle: true,
        title: const Text(
          'Posts Threads',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
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
            return const Center(
              child: Text(
                'No posts available.',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
