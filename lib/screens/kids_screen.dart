import 'package:flutter/material.dart';
import 'package:learning_app/screens/product_detail_screen.dart';
import 'package:learning_app/widgtes/cart_icon_with_badge.dart'; // ✅ ضفنا دي

class KidsScreen extends StatelessWidget {
  const KidsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> products = [
      {
        'name': 'Kids T-Shirt',
        'image': 'assets/images/kids_tshirt.png',
        'description': 'Cute t-shirt for kids.',
        'price': 19.99,
      },
      {
        'name': 'Kids Jacket',
        'image': 'assets/images/kids_jacket.png',
        'description': 'Warm and comfy jacket.',
        'price': 39.99,
      },
      {
        'name': 'Kids T-Shirt',
        'image': 'assets/images/kids_tshirt1.png',
        'description': 'Cute t-shirt for kids.',
        'price': 22.99,
      },
      {
        'name': 'Kids Jacket',
        'image': 'assets/images/kids_jacket2.png',
        'description': 'Warm and comfy jacket.',
        'price': 29.99,
      },
      {
        'name': 'Kids Hoodie',
        'image': 'assets/images/kids_hoodie.png',
        'description': 'Cute hoodie for kids.',
        'price': 49.99,
      },
      {
        'name': 'Kids Jacket',
        'image': 'assets/images/kids_jacket4.png',
        'description': 'Warm and comfy jacket.',
        'price': 39.99,
      },
      {
        'name': 'Kids Hoodie',
        'image': 'assets/images/kids_hoodie3.png',
        'description': 'Cute hoodie for kids.',
        'price': 19.39,
      },
      {
        'name': 'Kids short',
        'image': 'assets/images/kids_shorts.png',
        'description': 'Warm and comfy shorts.',
        'price': 39.99,
      },
      {
        'name': 'Kids shorts',
        'image': 'assets/images/kids_shorts2.png',
        'description': 'Cute shorts for kids.',
        'price': 9.99,
      },
      {
        'name': 'Kids Jacket',
        'image': 'assets/images/kids_jacket3.png',
        'description': 'Warm and comfy jacket.',
        'price': 39.99,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kids Clothes'), // ✅ عدلنا الاسم
        actions: const [
          CartIconWithBadge(), // ✅ بدل IconButton العادي
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
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
                    name: product['name'],
                    image: product['image'],
                    description: product['description'],
                    price: product['price'],
                  ),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      product['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  product['name'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${product['price'].toStringAsFixed(2)}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
