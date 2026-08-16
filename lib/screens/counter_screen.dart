import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/counter_provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Counter Value',
              style: TextStyle(
                fontSize: 22,
              ),
            ),

            const SizedBox(height: 20),

            Consumer<CounterProvider>(
              builder: (context, counter, child) {
                return Text(
                  '${counter.count}',
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<CounterProvider>()
                        .decrement();
                  },
                  child: const Text('-'),
                ),

                const SizedBox(width: 15),

                ElevatedButton(
                  onPressed: () {
                    context
                        .read<CounterProvider>()
                        .increment();
                  },
                  child: const Text('+'),
                ),

                const SizedBox(width: 15),

                ElevatedButton(
                  onPressed: () {
                    context
                        .read<CounterProvider>()
                        .reset();
                  },
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}