import 'package:flutter/material.dart';
import 'package:posts_app/views/home.dart';
import 'package:posts_app/views/profile_page.dart';
import 'package:posts_app/widget/custom_nav_bar.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  int _selectedIndex = 1;

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
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff222337),
        centerTitle: true,
        title: const Text(
          'Favorite Posts',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'No Available Fav post yet',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
