import 'package:flutter/material.dart';
import 'package:learning_app/screens/cart_screen.dart';
import 'package:learning_app/screens/kids_screen.dart';
import 'package:learning_app/screens/men_screen.dart';
import 'package:learning_app/screens/women_screen.dart';
import 'package:learning_app/widgtes/feature_card_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('loggedIn');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
              onPressed: () => _logout(context),
              icon: const Icon(Icons.logout)),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FeatureCard(
              title: 'Women',
              image: 'assets/images/women1.jpg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WomenScreen()),
                );
              },
            ),
            const SizedBox(height: 16),
            FeatureCard(
              title: 'Men',
              image: 'assets/images/men1.jpg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MenScreen()),
                );
              },
            ),
            const SizedBox(height: 16),
            FeatureCard(
              title: 'Kids',
              image: 'assets/images/kids1.jpg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const KidsScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
      BuildContext context, String title, String imagePath) {
    return Card(
      child: InkWell(
        onTap: () {
          // Navigate to detail screens (later)
        },
        child: Column(
          children: [
            Expanded(
                child: Image.asset(imagePath,
                    fit: BoxFit.cover, width: double.infinity)),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
