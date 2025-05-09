import 'package:flutter/material.dart';

import 'product_detail_screen.dart';

class KidsScreen extends StatelessWidget {
  const KidsScreen({super.key});

  final List<Map<String, String>> products = const [
    {
      'name': 'Elegant Dress',
      'image': 'assets/images/dress.png',
      'description':
          'A beautiful elegant dress made of silk, perfect for parties and formal events.',
    },
    {
      'name': 'Summer T-Shirt',
      'image': 'assets/images/women_dress.png',
      'description':
          'Light and comfortable t-shirt, ideal for the summer season.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Women\'s Clothes')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.asset(product['image']!,
                width: 60, height: 60, fit: BoxFit.cover),
            title: Text(product['name']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailScreen(
                    name: product['name']!,
                    image: product['image']!,
                    description: product['description']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
