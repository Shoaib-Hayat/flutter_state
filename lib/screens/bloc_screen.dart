import 'package:flutter/material.dart';

import 'bloc_counter_screen.dart';
import 'bloc_theme_screen.dart';
import 'bloc_todo_screen.dart';

class BlocScreen extends StatelessWidget {
  const BlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Examples'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _exampleButton(
            context,
            'Example 1 - Counter BLoC',
            const BlocCounterScreen(),
          ),

          _exampleButton(
            context,
            'Example 2 - Theme BLoC',
            const BlocThemeScreen(),
          ),

          _exampleButton(
            context,
            'Example 3 - Todo BLoC',
            const BlocTodoScreen(),
          ),

          _disabledButton(
            'Example 4 - User/API BLoC',
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

  Widget _disabledButton(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: ElevatedButton(
        onPressed: null,
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