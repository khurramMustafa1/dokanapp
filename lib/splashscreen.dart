
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internshipproject2/welcome.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override

  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Welcome()),
      );
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF5934),
      body:Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Dokan",style: TextStyle(
                  fontSize: 46,fontFamily: "Kronaone",
                    letterSpacing: -3.48,fontWeight: FontWeight.bold,
                color: Color(0xffFFFFFF)),)
              ],
            ),
          ),
          Positioned(
              top: 418,
              left: 201,
              child: Text("Retailer App",style: TextStyle(
              fontSize: 18,fontFamily:
              "Kronaone",letterSpacing: -1,fontWeight: FontWeight.w500,color: Color(0xffFFFFFF)
          ),) ),
          Positioned(
              bottom: 24,
              left: 135,
              child: Text("Sky Pulse Solution",style: TextStyle(
                  fontSize: 16,fontFamily:
              "Kronaone",letterSpacing: -1,fontWeight: FontWeight.w500,
    color: Color(0xffFFFFFF) ),) ),
        ],
      )

    );
  }
}
