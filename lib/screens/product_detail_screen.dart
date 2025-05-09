import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final String title;
  final String description;
  final double price;

  const ProductDetailScreen({
    super.key,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/product_placeholder.png', height: 250),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Text(
              '\$$price',
              style: const TextStyle(fontSize: 22, color: Colors.teal),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Implement adding to cart or any other functionality
              },
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
