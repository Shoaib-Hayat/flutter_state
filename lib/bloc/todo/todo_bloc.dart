import 'package:flutter_bloc/flutter_bloc.dart';

import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc()
      : super(
    const TodoState(
      todos: [],
      completed: [],
    ),
  ) {
    on<AddTodo>(_addTodo);
    on<DeleteTodo>(_deleteTodo);
    on<ToggleTodo>(_toggleTodo);
    on<ClearTodos>(_clearTodos);
  }

  void _addTodo(
      AddTodo event,
      Emitter<TodoState> emit,
      ) {
    if (event.title.trim().isEmpty) {
      return;
    }

    final newTodos = List<String>.from(state.todos);
    final newCompleted = List<bool>.from(state.completed);

    newTodos.add(event.title.trim());
    newCompleted.add(false);

    emit(
      state.copyWith(
        todos: newTodos,
        completed: newCompleted,
      ),
    );
  }

  void _deleteTodo(
      DeleteTodo event,
      Emitter<TodoState> emit,
      ) {
    final newTodos = List<String>.from(state.todos);
    final newCompleted = List<bool>.from(state.completed);

    newTodos.removeAt(event.index);
    newCompleted.removeAt(event.index);

    emit(
      state.copyWith(
        todos: newTodos,
        completed: newCompleted,
      ),
    );
  }

  void _toggleTodo(
      ToggleTodo event,
      Emitter<TodoState> emit,
      ) {
    final newCompleted = List<bool>.from(state.completed);

    newCompleted[event.index] =
    !newCompleted[event.index];

    emit(
      state.copyWith(
        completed: newCompleted,
      ),
    );
  }

  void _clearTodos(
      ClearTodos event,
      Emitter<TodoState> emit,
      ) {
    emit(
      const TodoState(
        todos: [],
        completed: [],
      ),
    );
  }
}