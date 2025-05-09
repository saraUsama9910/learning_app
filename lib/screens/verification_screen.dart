import 'package:flutter/material.dart';
import 'home_screen.dart';

class VerificationScreen extends StatefulWidget {
  final String generatedCode; // الكود اللي اتبعت للمستخدم

  const VerificationScreen({super.key, required this.generatedCode});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController codeController = TextEditingController();
  String? errorMessage;

  void verifyCode() {
    if (codeController.text.trim() == widget.generatedCode) {
      // ✅ لو الكود صح → روح لل Home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } else {
      // ❌ لو غلط → Error message
      setState(() {
        errorMessage = 'Invalid code. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify your Email')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter the verification code sent to your email:',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: codeController,
              decoration: InputDecoration(
                labelText: 'Verification Code',
                border: OutlineInputBorder(),
                errorText: errorMessage,
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: verifyCode,
              child: const Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}
