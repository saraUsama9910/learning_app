import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'verification_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String errorMessage = '';

  void _signup() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      String code = (1000 +
              (9999 - 1000) *
                  (DateTime.now().millisecondsSinceEpoch % 1000) /
                  1000)
          .toInt()
          .toString();

      print('Verification code: $code'); // مؤقت

      // ✅ بعت الكود على الإيميل
      await sendEmailVerification(emailController.text, code);

      // ✅ روح على صفحة التحقق
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Sign Up',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
        backgroundColor:
            const Color.fromARGB(255, 248, 148, 169), // تعديل لون الـ AppBar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // إضافة صورة في أعلى الصفحة
              Image.asset(
                'assets/images/signup_image.png', // تأكد من المسار الصحيح للصورة
                height: 220,
                width: 300,
              ),
              const SizedBox(height: 20),

              // حقل الإيميل مع تصميم جذاب
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Color.fromARGB(255, 248, 148, 169),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 248, 148, 169),
                    ),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),

              // حقل كلمة المرور مع تصميم جذاب
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Color.fromARGB(255, 248, 148, 169),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 248, 148, 169),
                    ),
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),

              // زر تسجيل الحساب بتصميم جميل
              ElevatedButton(
                onPressed: _signup,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 248, 148, 169), // تغيير لون الزر
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // رسالة الخطأ
              if (errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),

              // رابط تسجيل الدخول في حال لم يكن لديك حساب
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // العودة إلى صفحة الدخول
                },
                child: const Text(
                  'Already have an account? Log in',
                  style: TextStyle(color: Color.fromARGB(255, 241, 113, 141)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
