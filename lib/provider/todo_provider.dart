import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  final List<String> todos = [];
  final List<bool> completed = [];

  void addTodo(String todo) {
    if (todo.trim().isEmpty) {
      return;
    }

    todos.add(todo.trim());
    completed.add(false);

    notifyListeners();
  }

  void deleteTodo(int index) {
    todos.removeAt(index);
    completed.removeAt(index);

    notifyListeners();
  }

  void toggleTodo(int index) {
    completed[index] = !completed[index];

    notifyListeners();
  }

  void clearTodos() {
    todos.clear();
    completed.clear();

    notifyListeners();
  }
}