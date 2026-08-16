import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/todo/todo_bloc.dart';
import '../bloc/todo/todo_event.dart';
import '../bloc/todo/todo_state.dart';

class BlocTodoScreen extends StatelessWidget {
  const BlocTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoBloc(),
      child: const _TodoView(),
    );
  }
}

class _TodoView extends StatefulWidget {
  const _TodoView();

  @override
  State<_TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<_TodoView> {
  final TextEditingController controller =
  TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void addTodo(BuildContext context) {
    if (controller.text.trim().isEmpty) {
      return;
    }

    context.read<TodoBloc>().add(
      AddTodo(controller.text),
    );

    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC - Todo'),
        actions: [
          BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              return IconButton(
                onPressed: state.todos.isEmpty
                    ? null
                    : () {
                  context.read<TodoBloc>().add(
                    ClearTodos(),
                  );
                },
                icon: const Icon(
                  Icons.delete_sweep,
                ),
              );
            },
          ),
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      labelText: 'Enter Todo',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) {
                      addTodo(context);
                    },
                  ),
                ),

                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {
                    addTodo(context);
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ),

          Expanded(
            child: BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                if (state.todos.isEmpty) {
                  return const Center(
                    child: Text(
                      'No Todo Available',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: state.todos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Checkbox(
                        value: state.completed[index],
                        onChanged: (_) {
                          context.read<TodoBloc>().add(
                            ToggleTodo(index),
                          );
                        },
                      ),

                      title: Text(
                        state.todos[index],
                        style: TextStyle(
                          decoration:
                          state.completed[index]
                              ? TextDecoration
                              .lineThrough
                              : TextDecoration.none,
                        ),
                      ),

                      trailing: IconButton(
                        onPressed: () {
                          context.read<TodoBloc>().add(
                            DeleteTodo(index),
                          );
                        },
                        icon: const Icon(
                          Icons.delete,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}