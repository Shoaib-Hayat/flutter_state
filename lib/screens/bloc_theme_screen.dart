import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/theme/theme_bloc.dart';
import '../bloc/theme/theme_event.dart';
import '../bloc/theme/theme_state.dart';

class BlocThemeScreen extends StatelessWidget {
  const BlocThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeBloc(),
      child: const _ThemeView(),
    );
  }
}

class _ThemeView extends StatelessWidget {
  const _ThemeView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Theme(
          data: state.isDark
              ? ThemeData.dark()
              : ThemeData.light(),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('BLoC - Theme'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Icon(
                    state.isDark
                        ? Icons.dark_mode
                        : Icons.light_mode,
                    size: 100,
                  ),

                  const SizedBox(height: 25),

                  Text(
                    state.isDark
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
                          .read<ThemeBloc>()
                          .add(
                        ToggleTheme(),
                      );
                    },
                    child: Text(
                      state.isDark
                          ? 'Switch to Light'
                          : 'Switch to Dark',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}