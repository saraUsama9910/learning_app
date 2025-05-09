import 'package:flutter/material.dart';

import 'product_detail_screen.dart';

class KidsScreen extends StatelessWidget {
  const KidsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kids\' Clothes')),
      body: ListView(
        children: [
          _buildProductTile(context, 'T-shirt', 'assets/kids_tshirt.png',
              'Colorful kids T-shirt.', 12.99),
          _buildProductTile(context, 'Shorts', 'assets/kids_shorts.png',
              'Comfortable kids shorts.', 14.99),
          _buildProductTile(context, 'Jacket', 'assets/kids_jacket.png',
              'Warm kids jacket.', 24.99),
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
