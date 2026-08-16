class TodoState {
  final List<String> todos;
  final List<bool> completed;

  const TodoState({
    required this.todos,
    required this.completed,
  });

  TodoState copyWith({
    List<String>? todos,
    List<bool>? completed,
  }) {
    return TodoState(
      todos: todos ?? this.todos,
      completed: completed ?? this.completed,
    );
  }
}