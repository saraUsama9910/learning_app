import 'package:flutter/material.dart';
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
              onPressed: () => _logout(context), icon: const Icon(Icons.logout))
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        children: [
          _buildCategoryCard(context, 'Women', 'assets/images/women.jpg'),
          _buildCategoryCard(context, 'Men', 'assets/images/men.jpg'),
          _buildCategoryCard(context, 'Kids', 'assets/images/kids.jpg'),
          _buildCategoryCard(context, 'Cart', 'assets/images/cart.jpg'),
        ],
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
