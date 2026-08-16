abstract class TodoEvent {}

class AddTodo extends TodoEvent {
  final String title;

  AddTodo(this.title);
}

class DeleteTodo extends TodoEvent {
  final int index;

  DeleteTodo(this.index);
}

class ToggleTodo extends TodoEvent {
  final int index;

  ToggleTodo(this.index);
}

class ClearTodos extends TodoEvent {}