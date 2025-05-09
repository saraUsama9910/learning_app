import 'package:flutter/material.dart';
import 'package:learning_app/model/cart_provider.dart';
import 'package:learning_app/splash_screen.dart';
import 'package:provider/provider.dart'; // ✅ ضيفنا دي عشان ال Provider

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
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
