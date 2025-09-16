import 'package:flutter/material.dart';
import 'package:internshipproject2/bottomnavigationbar.dart';
import 'package:internshipproject2/createaccount.dart';
import 'package:internshipproject2/services/auth.dart' show UserService;
import 'package:internshipproject2/widgets/Textfield.dart' show customTextField;
import 'package:internshipproject2/widgets/button.dart';
import 'widgets/customtext.dart';

class LoginPage extends StatefulWidget { // ✅ renamed from "login"
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Login", style: TextStyle(
                  fontSize: 28, fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF121212), letterSpacing: -1
              ),),

              SizedBox(height: 6,),

              customText1("Please enter the email and password associated with \nyour account."),

              SizedBox(height: 30,),

              customTextField(
                hintText: "Email",
                controller: email,
                keyboardType: TextInputType.emailAddress,
              ),

              SizedBox(height: 30,),

              customTextField(
                hintText: "Password",
                controller: password,
                keyboardType: TextInputType.visiblePassword,
              ),

              SizedBox(height: 279,),

              orangebutton(
                text: isLoading ? "Please wait..." : "Login",
                onPressed: isLoading ? null : _handleLogin,
              ),

              SizedBox(height: 10,),

              whitebutton(
                firstText: "Don’t have an account?",
                secondText: "Create Account",
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => create_account()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleLogin() async {
    setState(() => isLoading = true);

    final user = await UserService.login(
      email: email.text.trim(),
      password: password.text.trim(),
    );

    setState(() => isLoading = false);

    if (user != null && user.token != null) { // ✅ works now
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login successful!")),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavDemo()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login failed. Check credentials.")),
      );
    }
  }
}
