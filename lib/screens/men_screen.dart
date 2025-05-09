import 'package:flutter/material.dart';
import 'package:learning_app/screens/product_detail_screen.dart';
import 'package:learning_app/widgtes/cart_icon_with_badge.dart'; // ✅ ضفنا دي

class MenScreen extends StatelessWidget {
  const MenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> products = [
      {
        'name': 'Men Shirt',
        'image': 'assets/images/men_shirt.png',
        'description': 'Stylish shirt for men.',
        'price': 29.99,
      },
      {
        'name': 'Men Jacket',
        'image': 'assets/images/men_jacket.png',
        'description': 'Warm winter jacket.',
        'price': 59.99,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Men Clothes'),
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
          childAspectRatio: 0.75, // ✅ عشان الصورة تطلع شكلها مظبوط
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
                    price: product['price'], // ✅ ضفنا السعر هنا
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
