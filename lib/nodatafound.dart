import 'package:flutter/material.dart';
class Nodatafound extends StatelessWidget {
  const Nodatafound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 50,left: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/cloud1.png",
              height: 180,
              width: 180,
            ),
           SizedBox(height: 15),
            Text("No Data Found",style: TextStyle(fontSize: 24,
                fontWeight: FontWeight.w700,letterSpacing: -0.5),),
            SizedBox(height: 5),
            Text("Please add or import data first",style: TextStyle(fontSize: 18,
                fontWeight: FontWeight.w400,letterSpacing: 0),),
          ],
        ),
      )

    );
  }
}
