import 'package:flutter/material.dart';
import 'package:internshipproject2/Widgets/customText.dart';
import 'package:internshipproject2/Widgets/textfield.dart';
import 'package:internshipproject2/createaccount.dart';
import 'package:internshipproject2/widgets/button.dart' show whitebutton, orangebutton;
import 'package:provider/provider.dart';

import 'package:internshipproject2/services/auth.dart'; // ✅ this is actually your UserService
import 'package:internshipproject2/midel/usermodel.dart'; // ✅ your UserModel
import 'package:internshipproject2/bottomnavigationbar.dart';

import 'provider/token.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool _isLoading = false;

  Future<void> _loginUser() async {
    if (email.text.isEmpty || password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter email and password")),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final user = await UserService.login(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      if (user != null && user.token != null) {
        // ✅ Save token in Provider
        Provider.of<Token>(context, listen: false).setToken(user.token!);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login successful")),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavDemo()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login failed. Check credentials.")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF121212),
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 6),
              customText1(
                "Please enter the email and password associated with \nyour account.",
              ),
              const SizedBox(height: 30),
              customTextField(
                hintText: "Email",
                controller: email,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 30),
              customTextField(
                hintText: "Password",
                controller: password,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 279),

              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : orangebutton(
                text: "Login",
                onPressed: _loginUser,
              ),

              const SizedBox(height: 10),

              whitebutton(
                firstText: "Don’t have an account?",
                secondText: "Create Account",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const create_account()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
