import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              themeProvider.isDark
                  ? Icons.dark_mode
                  : Icons.light_mode,
              size: 100,
            ),

            const SizedBox(height: 20),

            Text(
              themeProvider.isDark
                  ? 'Dark Mode'
                  : 'Light Mode',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                context
                    .read<ThemeProvider>()
                    .toggleTheme();
              },
              child: Text(
                themeProvider.isDark
                    ? 'Switch to Light'
                    : 'Switch to Dark',
              ),
            ),
          ],
        ),
      ),
    );
  }
}