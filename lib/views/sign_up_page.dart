import 'package:flutter/material.dart';
import 'package:posts_app/models/data.dart';
import 'package:posts_app/views/home.dart';
import 'package:posts_app/widget/signUp/agree_terms.dart';
import 'package:posts_app/widget/signUp/custom_botton.dart';
import 'package:posts_app/widget/signUp/custom_text_field.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff222337),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),
                Consumer<postsDataModel>(
                  builder: (context, fullName, child) {
                    return CustomTextField(
                      label: 'Full Name',
                      onChange: (value) {
                        fullName.name = value;
                        fullName.nameNotifier();
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Consumer<postsDataModel>(
                  builder: (context, failEmail, child) {
                    return CustomTextField(
                      label: 'Email',
                      onChange: (value) {
                        failEmail.email = value;
                        failEmail.emailNotifier();
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Consumer<postsDataModel>(
                  builder: (context, failNumber, child) {
                    return CustomTextField(
                      label: 'Mobile Number',
                      onChange: (value) {
                        failNumber.phoneNumber = value;
                        failNumber.phone();
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Consumer<postsDataModel>(
                  builder: (context, imageUrl, child) {
                    return CustomTextField(
                      label: 'Image Url',
                      onChange: (value) {
                        imageUrl.image = value;
                        imageUrl.imageNotifier();
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  label: 'Password',
                  obscureText: true,
                  icon: const Icon(
                    Icons.visibility_off,
                  ),
                  onChange: (value) {},
                ),
                const SizedBox(
                  height: 6,
                ),
                const AgreeTerms(),
                const SizedBox(
                  height: 12,
                ),
                CustomButton(
                  height: 40,
                  fontSize: 20,
                  textColor: Colors.white,
                  label: 'Sign Up',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
