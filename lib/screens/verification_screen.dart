import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';

class VerificationScreen extends StatefulWidget {
  final String generatedCode;
  final String userEmail;

  const VerificationScreen(
      {super.key, required this.generatedCode, required this.userEmail});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final codeController = TextEditingController();
  String errorMessage = '';

  void _verify() async {
    if (codeController.text.trim() == widget.generatedCode) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('loggedIn', true);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    } else {
      setState(() {
        errorMessage = 'Invalid code. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify Email')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('A verification code was sent to ${widget.userEmail}'),
            const SizedBox(height: 20),
            TextField(
              controller: codeController,
              decoration: const InputDecoration(labelText: 'Enter Code'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _verify, child: const Text('Verify')),
            const SizedBox(height: 10),
            Text(errorMessage, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
