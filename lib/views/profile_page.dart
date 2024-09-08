import 'package:flutter/material.dart';
import 'package:posts_app/models/data.dart';
import 'package:posts_app/views/fav_page.dart';
import 'package:posts_app/views/home.dart';
import 'package:posts_app/widget/custom_nav_bar.dart';
import 'package:posts_app/widget/profile/photo.dart';
import 'package:posts_app/widget/profile/profile_options.dart';
import 'package:provider/provider.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 33,
            ),
            const BuildProfilePicture(
              color: Color(0xFFCF4D68),
            ),
            const SizedBox(
              height: 33,
            ),
            Consumer<postsDataModel>(
              builder: (context, failName, child) {
                return Text(
                  failName.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    color: Colors.white,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 33,
            ),
            Consumer<postsDataModel>(
              builder: (context, failEmail, child) {
                return ProfileOptions(
                  title: '${failEmail.email}',
                  icon: Icons.mail,
                );
              },
            ),
            const SizedBox(
              height: 19,
            ),
            Consumer<postsDataModel>(
              builder: (context, mobile, child) {
                return ProfileOptions(
                  title: '${mobile.phoneNumber}',
                  icon: Icons.phone,
                );
              },
            ),
            const SizedBox(
              height: 19,
            ),
            const ProfileOptions(
              title: 'Tell Your Friends',
              icon: Icons.send_rounded,
            ),
            const SizedBox(
              height: 19,
            ),
            const ProfileOptions(
              title: 'Settings',
              icon: Icons.settings,
            ),
            const SizedBox(
              height: 19,
            ),
            const ProfileOptions(
              title: 'Log Out',
              icon: Icons.logout_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
