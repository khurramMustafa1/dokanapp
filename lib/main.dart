import 'package:flutter/material.dart';
import 'package:internshipproject2/provider/category.dart' show CategoryProvider;
import 'package:internshipproject2/provider/token.dart';
import 'package:internshipproject2/splashscreen.dart' show splash_screen;
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers:
      [
        ChangeNotifierProvider(create: (context)=>TokenProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()), // ✅ added
      ],
     child:  const MyApp())
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:splash_screen(),
    );
  }
}

