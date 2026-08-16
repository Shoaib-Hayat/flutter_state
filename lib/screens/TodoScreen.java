import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/todo_provider.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController controller =
      TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void addTodo() {
    context
        .read<TodoProvider>()
        .addTodo(controller.text);

    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final todoProvider = context.watch<TodoProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Provider'),
        actions: [
          IconButton(
            onPressed: todoProvider.todos.isEmpty
                ? null
                : () {
                    context
                        .read<TodoProvider>()
                        .clearTodos();
                  },
            icon: const Icon(Icons.delete_sweep),
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
                      addTodo();
                    },
                  ),
                ),

                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: addTodo,
                  child: const Text('Add'),
                ),
              ],
            ),
          ),

          Expanded(
            child: todoProvider.todos.isEmpty
                ? const Center(
                    child: Text(
                      'No Todo Available',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: todoProvider.todos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Checkbox(
                          value:
                              todoProvider.completed[index],
                          onChanged: (_) {
                            context
                                .read<TodoProvider>()
                                .toggleTodo(index);
                          },
                        ),

                        title: Text(
                          todoProvider.todos[index],
                          style: TextStyle(
                            decoration: todoProvider
                                    .completed[index]
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),

                        trailing: IconButton(
                          onPressed: () {
                            context
                                .read<TodoProvider>()
                                .deleteTodo(index);
                          },
                          icon: const Icon(
                            Icons.delete,
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}