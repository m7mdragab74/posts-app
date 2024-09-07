import 'package:flutter/material.dart';
import 'package:posts_app/views/home.dart';
import 'package:posts_app/widget/agree_terms.dart';
import 'package:posts_app/widget/custom_botton.dart';
import 'package:posts_app/widget/custom_text_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222337),
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
                CustomTextField(
                  label: 'Full Name',
                  onChange: (value) {},
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  label: 'Email',
                  icon: Icon(
                    Icons.mail,
                  ),
                  onChange: (value) {},
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  label: 'Mobile Number',
                  icon: Icon(
                    Icons.phone_iphone_outlined,
                  ),
                  onChange: (value) {},
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  label: 'Image Url',
                  icon: Icon(
                    Icons.image,
                  ),
                  onChange: (value) {},
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  label: 'Password',
                  icon: Icon(
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
                        builder: (context) => HomePage(),
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
