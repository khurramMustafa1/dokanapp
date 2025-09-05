import 'package:flutter/material.dart';

class notification extends StatelessWidget {
  const notification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title:Text("Notifications", style: TextStyle(fontSize: 24, fontFamily: 'Inter',
            fontWeight: FontWeight.w700, color: Color(0xff121212),letterSpacing: -1),),
        centerTitle: false,
      ),
      body: ListView.builder(
        itemCount: 8, // number of notifications
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemBuilder: (context, index) {
          return Container(
            margin:  EdgeInsets.only(bottom: 12),
            padding:  EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xffEEF0F6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Red discount icon
                Image.asset("assets/images/discount.png", width: 38,height: 38,),
                SizedBox(width: 12),
                // Text content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text("Flash Sale Alert!",style: TextStyle(fontSize: 15, fontFamily: 'Inter',
                          fontWeight: FontWeight.w500, color: Color(0xff121212),letterSpacing: -1),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Don’t miss out on our one-day only flash sale!\nGet 20% off all Products.",
                        style: TextStyle(fontSize: 12, fontFamily: 'Inter',
                            fontWeight: FontWeight.w500, color: Color(0x66000000),letterSpacing: -1),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                // Time ago
                Text(
                  "1 Day Ago", style: TextStyle(fontSize: 11, fontFamily: 'Inter',
                    fontWeight: FontWeight.w500, color: Color(0x66000000),letterSpacing: -1),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}