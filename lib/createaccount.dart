import 'package:flutter/material.dart';
import 'package:internshipproject2/login.dart';
import 'package:internshipproject2/services/auth.dart' show UserService;
import '../Widgets/customText.dart';
import '../Widgets/textfield.dart';
import 'widgets/button.dart';
class create_account extends StatefulWidget {
  const create_account({super.key});

  @override
  State<create_account> createState() => _create_accountState();
}

class _create_accountState extends State<create_account> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController shop = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController shopaddress = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isLoading = false; // ✅ to show loader

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF121212),
                  letterSpacing: -1,
                ),
              ),
              SizedBox(height: 6),
              customText1("Please provide following details to create an account."),
              SizedBox(height: 30),

              customTextField(hintText: "Full Name", controller: name, keyboardType: TextInputType.name),
              SizedBox(height: 10),

              customTextField(
                hintText: "+92 ",
                controller: phone,
                keyboardType: TextInputType.number,
                prefixImage: "assets/images/pakistan.png",
              ),
              SizedBox(height: 10),

              customTextField(hintText: "Shop Name", controller: shop, keyboardType: TextInputType.name),
              SizedBox(height: 10),

              customTextField(hintText: "Email", controller: email, keyboardType: TextInputType.emailAddress),
              SizedBox(height: 10),

              customTextField(
                hintText: "Shop Address",
                controller: shopaddress,
                keyboardType: TextInputType.name,
                suffixImage: "assets/images/ll.png",
              ),
              SizedBox(height: 10),

              customTextField(hintText: "Password", controller: password, keyboardType: TextInputType.visiblePassword),
              SizedBox(height: 55),

              orangebutton(
                text: isLoading ? "Please wait..." : "Create Account",
                onPressed: isLoading ? null : _handleRegister, // ✅ call service
              ),
              SizedBox(height: 10),

              whitebutton(
                firstText: "Already have an account?",
                secondText: "Login",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleRegister() async {
    setState(() => isLoading = true);

    final user = await UserService.register(
      name: name.text.trim(),
      email: email.text.trim(),
      password: password.text.trim(),
      phoneNumber: phone.text.trim(),
      shopName: shop.text.trim(),
      shopAddress: shopaddress.text.trim(),
    );

    setState(() => isLoading = false);

    if (user != null && user.success == true) {
      // ✅ success → move to login
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration successful! Please login.")),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      // ❌ failed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration failed. Try again.")),
      );
    }
  }
}
