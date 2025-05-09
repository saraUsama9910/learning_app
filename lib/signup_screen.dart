import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  Future<void> _signup(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _signup(context),
          child: const Text('Sign Up'),
        ),
      ),
    );
  }
}
