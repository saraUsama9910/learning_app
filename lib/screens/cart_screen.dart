import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  static List<Map<String, String>> cartItems = [];

  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),
      body: CartScreen.cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : ListView.builder(
              itemCount: CartScreen.cartItems.length,
              itemBuilder: (context, index) {
                final item = CartScreen.cartItems[index];
                return ListTile(
                  leading: Image.asset(item['image']!,
                      width: 60, height: 60, fit: BoxFit.cover),
                  title: Text(item['name']!),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        CartScreen.cartItems.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
    );
  }
}
