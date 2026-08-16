import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const List<String> products = [
    'Laptop',
    'Mobile',
    'Headphones',
    'Keyboard',
    'Mouse',
  ];

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                'Cart: ${cart.cartCount}',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          final added = cart.isInCart(product);

          return Card(
            child: ListTile(
              leading: const Icon(
                Icons.shopping_bag,
              ),
              title: Text(product),
              trailing: ElevatedButton(
                onPressed: () {
                  if (added) {
                    context
                        .read<CartProvider>()
                        .removeItem(product);
                  } else {
                    context
                        .read<CartProvider>()
                        .addItem(product);
                  }
                },
                child: Text(
                  added ? 'Remove' : 'Add',
                ),
              ),
            ),
          );
        },
      ),

      bottomNavigationBar: cart.cartItems.isEmpty
          ? null
          : Padding(
        padding: const EdgeInsets.all(12),
        child: ElevatedButton(
          onPressed: () {
            context
                .read<CartProvider>()
                .clearCart();
          },
          child: const Text('Clear Cart'),
        ),
      ),
    );
  }
}