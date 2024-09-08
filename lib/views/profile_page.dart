import 'package:flutter/material.dart';
import 'package:posts_app/views/fav_page.dart';
import 'package:posts_app/views/home.dart';
import 'package:posts_app/widget/custom_nav_bar.dart';
import 'package:posts_app/widget/profile/photo.dart';
import 'package:posts_app/widget/profile/profile_options.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 2;

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
      body: const Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 33,
            ),
            BuildProfilePicture(
              color: Color(0xFFCF4D68),
            ),
            SizedBox(
              height: 33,
            ),
            Text(
              'Mohamed Ragab',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 33,
            ),
            ProfileOptions(
              title: 'mr341349@gmail.com',
              icon: Icons.mail,
            ),
            SizedBox(
              height: 19,
            ),
            ProfileOptions(
              title: '01060659309',
              icon: Icons.phone,
            ),
            SizedBox(
              height: 19,
            ),
            ProfileOptions(
              title: 'Tell Your Friends',
              icon: Icons.send_rounded,
            ),
            SizedBox(
              height: 19,
            ),
            ProfileOptions(
              title: 'Settings',
              icon: Icons.settings,
            ),
            SizedBox(
              height: 19,
            ),
            ProfileOptions(
              title: 'Log Out',
              icon: Icons.logout_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
