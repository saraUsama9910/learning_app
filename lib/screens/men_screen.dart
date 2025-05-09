import 'package:flutter/material.dart';

import 'product_detail_screen.dart';

class MenScreen extends StatelessWidget {
  const MenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Men\'s Clothes')),
      body: ListView(
        children: [
          _buildProductTile(context, 'Casual Shirt', 'assets/men_shirt.png',
              'A cool casual shirt.', 25.99),
          _buildProductTile(context, 'Leather Jacket', 'assets/men_jacket.png',
              'Stylish leather jacket.', 49.99),
          _buildProductTile(context, 'Jeans', 'assets/men_jeans.png',
              'Classic denim jeans.', 29.99),
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
