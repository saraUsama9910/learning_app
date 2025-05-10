import 'package:flutter/material.dart';
import 'package:learning_app/screens/kids_screen.dart';
import 'package:learning_app/screens/men_screen.dart';
import 'package:learning_app/screens/women_screen.dart';
import 'package:learning_app/widgtes/cart_icon_with_badge.dart';
import 'package:learning_app/widgtes/feature_card_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('loggedIn');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Fashion Hub 👗👔'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.pinkAccent,
        actions: [
          const CartIconWithBadge(),
          IconButton(
            onPressed: () => _logout(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink.shade100, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Choose Your Style ✨',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink.shade800,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                AnimatedOpacity(
                  opacity: 1,
                  duration: const Duration(milliseconds: 800),
                  child: FeatureCard(
                    title: 'Women',
                    image: 'assets/images/women.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WomenScreen(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                AnimatedOpacity(
                  opacity: 1,
                  duration: const Duration(milliseconds: 1000),
                  child: FeatureCard(
                    title: 'Men',
                    image: 'assets/images/men.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MenScreen(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                AnimatedOpacity(
                  opacity: 1,
                  duration: const Duration(milliseconds: 1200),
                  child: FeatureCard(
                    title: 'Kids',
                    image: 'assets/images/kids.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const KidsScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
