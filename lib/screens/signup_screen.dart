import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'verification_screen.dart';

Future<void> sendEmailVerification(String email, String code) async {
  const serviceId = 'service_66ugjma';
  const templateId = 'template_70i3298';
  const userId = 'tPpJIEkeUTVcJd-9U';

  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  final response = await http.post(url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_email': email,
          'verification_code': code,
        }
      }));
  if (response.statusCode == 200) {
    print('Verification email sent');
  } else {
    print('Failed to send email: ${response.body}');
  }
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String errorMessage = '';

  void _signup() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      String code = (1000 +
              (9999 - 1000) *
                  (DateTime.now().millisecondsSinceEpoch % 1000) /
                  1000)
          .toInt()
          .toString();
      print('Verification code: $code'); // مؤقت
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => VerificationScreen(
                    generatedCode: code,
                    userEmail: emailController.text,
                  )));
    } else {
      setState(() {
        errorMessage = 'Please fill in all fields.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _signup, child: const Text('Sign Up')),
            const SizedBox(height: 10),
            Text(errorMessage, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
