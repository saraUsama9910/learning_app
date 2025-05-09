import 'package:flutter/material.dart';

import 'product_detail_screen.dart';

class WomenScreen extends StatelessWidget {
  const WomenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Women\'s Clothes')),
      body: ListView(
        children: [
          _buildProductTile(context, 'Floral Dress', 'assets/women_dress.png',
              'A beautiful floral dress.', 29.99),
          _buildProductTile(context, 'Blue Jeans', 'assets/women_jeans.png',
              'Comfortable blue jeans.', 19.99),
          _buildProductTile(context, 'Black Top', 'assets/women_top.png',
              'A stylish black top.', 14.99),
        ],
      ),
    );
  }

  Widget _buildProductTile(BuildContext context, String title, String image,
      String description, double price) {
    return ListTile(
      leading: Image.asset(image, width: 50, height: 50),
      title: Text(title),
      subtitle: Text('\$$price'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailScreen(
                title: title, description: description, price: price),
          ),
        );
      },
    );
  }
}
