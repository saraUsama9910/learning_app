import 'package:flutter/material.dart';

import 'product_detail_screen.dart';

class MenScreen extends StatelessWidget {
  const MenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> products = [
      {
        'name': 'Men Shirt',
        'image': 'assets/images/men_shirt.jpg',
        'description': 'Stylish shirt for men.'
      },
      {
        'name': 'Men Jacket',
        'image': 'assets/images/men_jacket.jpg',
        'description': 'Warm winter jacket.'
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Men Clothes')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          var product = products[index];
          return GestureDetector(
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
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(product['image']!, fit: BoxFit.cover),
                ),
                const SizedBox(height: 8),
                Text(product['name']!),
              ],
            ),
          );
        },
      ),
    );
  }
}
