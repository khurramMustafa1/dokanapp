import 'package:flutter/material.dart';

class customTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final String? prefixImage; // optional prefix image
  final String? suffixImage; // optional suffix image
  final TextEditingController controller;
  final TextInputType keyboardType; // ✅ new property

  const customTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.prefixImage,
    this.suffixImage,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
            color: Color(0xFFADADAF),
            fontSize: 16,fontWeight: FontWeight.w500, fontFamily: "inter", letterSpacing: -1
        ),
        filled: true,
        fillColor: Color(0xFFEEF0F6),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),

        prefixIcon: prefixImage != null
            ? Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(prefixImage!, width: 20, height: 20),
        )
            : null,

        suffixIcon: suffixImage != null
            ? Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(suffixImage!, width: 20, height: 20),
        )
            : null,
      ),
    );
  }
}