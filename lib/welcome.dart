import 'package:flutter/material.dart';
import 'package:internshipproject2/createaccount.dart';
import 'package:internshipproject2/login.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF0F6),
      body: Stack(
        children: [
          // Dokan text
          Positioned(
            top: 150,
            left: 21,
            child: const Text(
              "Dokan",
              style: TextStyle(
                fontSize: 46,
                fontFamily: "Kronaone",
                letterSpacing: -3.48,
                fontWeight: FontWeight.bold,
                color: Color(0xffFF5934),
              ),
            ),
          ),
          const Positioned(
            top: 200,
            left: 70,
            child: Text(
              "Retailer App",
              style: TextStyle(
                fontSize: 18,
                fontFamily: "Kronaone",
                letterSpacing: -1,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),

          // Full page container below
          Positioned(
            top: 260, // just below Retailer App
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome to Dokan!",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Row 1
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/shoping.png", height: 28),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          "We make shopping for your business easier than ever before",
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Row 2
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/product_list.png", height: 28),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          "Our app offers extensive product listings",
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/order.png", height: 28),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          "Our ordering system is user-friendly",
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Row 4
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/store.png", height: 28),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          "Find everything you need to keep your business running smoothly",
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/c.png", height: 28),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          "Start shopping now and experience the convenience!",
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  // Buttons
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffFF5934),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>create_account()));},
                      child: const Text(
                        "Create Account",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: Color(0xffBDBDBD), width: 2), // border
                        )
                       // remove shadow for flat look
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                      },
                      child: const Text.rich(
                        TextSpan(
                          text: "Have an account? ",
                          style: TextStyle(fontSize: 14, color: Color(0xffBDBDBD)),
                          children: [
                            TextSpan(
                              text: "Login",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffFF5934),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
