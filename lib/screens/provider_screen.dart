import 'package:flutter/material.dart';

import 'counter_screen.dart';
import 'theme_screen.dart';
import 'cart_screen.dart';
import 'todo_screen.dart';

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Examples'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _exampleButton(
            context,
            'Example 1 - Counter',
            const CounterScreen(),
          ),

          _exampleButton(
            context,
            'Example 2 - Theme',
            const ThemeScreen(),
          ),

          _exampleButton(
            context,
            'Example 3 - Shopping Cart',
            const CartScreen(),
          ),

          _exampleButton(
            context,
            'Example 4 - Todo',
            const TodoScreen(),
          ),
        ],
      ),
    );
  }

  Widget _exampleButton(
      BuildContext context,
      String title,
      Widget screen,
      ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => screen,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}