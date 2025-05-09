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
        title: const Text('Home'),
        actions: [
          const CartIconWithBadge(), // ✅ هنا بدل الـ IconButton القديم
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
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FeatureCard(
                  title: 'Women',
                  image: 'assets/images/women_dress.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WomenScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                FeatureCard(
                  title: 'Men',
                  image: 'assets/images/men_jacket.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MenScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                FeatureCard(
                  title: 'Kids',
                  image: 'assets/images/kids_tshirt.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const KidsScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
