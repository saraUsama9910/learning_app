import 'package:flutter/material.dart';
import 'package:learning_app/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fashion App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Poppins',
      ),
      home: const SplashScreen(),
    );
  }
}
