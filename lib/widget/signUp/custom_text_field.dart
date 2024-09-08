import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.icon,
    this.onChange,
  });

  final String label;
  final TextInputType keyboardType;
  final bool obscureText;
  final Icon? icon;
  final void Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      cursorErrorColor: Colors.white,
      onChanged: onChange,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        filled: true,
        fillColor: const Color(0xff323243),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        suffixIcon: icon,
        suffixIconColor: Colors.white,
      ),
    );
  }
}
