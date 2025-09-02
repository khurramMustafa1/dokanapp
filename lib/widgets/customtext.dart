import 'package:flutter/material.dart';

class customText1 extends StatelessWidget {
  final String text;
  final TextAlign align;

  const customText1(
      this.text, {
        super.key,
        this.align = TextAlign.start,
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: const TextStyle(
        fontSize: 15,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        color: Color(0xFF949494),
        letterSpacing: -1,
      ),
    );
  }
}