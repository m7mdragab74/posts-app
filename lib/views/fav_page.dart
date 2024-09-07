import 'package:flutter/material.dart';
import 'package:posts_app/database/db_helper.dart';
import 'package:posts_app/models/post_model.dart';
import 'package:posts_app/views/home.dart';
import 'package:posts_app/views/profile_page.dart';
import 'package:posts_app/widget/custom_nav_bar.dart';
import 'package:posts_app/widget/post_widget.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  List<PostModel> _favorites = [];
  bool _isLoading = true;
  int _selectedIndex = 1; // Default to FavPage

  @override
  void initState() {
    super.initState();
    _fetchFavorites();
  }

  Future<void> _fetchFavorites() async {
    final db = DatabaseHelper();
    final favorites = await db.getFavorites();
    setState(() {
      _favorites = favorites;
      _isLoading = false;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to the selected page
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const FavPage()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
        break;
    }
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
        onItemSelected: _onItemTapped, // Handle page navigation
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff222337),
        centerTitle: true,
        title: const Text(
          'Favorite Posts',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _favorites.isEmpty
              ? const Center(
                  child: Text(
                    'No favorites yet',
                    style: TextStyle(color: Colors.white), // Make text visible
                  ),
                )
              : ListView.builder(
                  itemCount: _favorites.length,
                  itemBuilder: (context, index) {
                    return PostWidget(
                      postModel: _favorites[index],
                    );
                  },
                ),
    );
  }
}
