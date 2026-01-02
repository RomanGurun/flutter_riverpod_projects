import 'todo.dart';

class TodoState {
  final List todos;
  final bool isLoading;
  final String? error;

  TodoState({
    required this.todos,
    this.isLoading = false,
    this.error,
  });

  TodoState copyWith({
    List? todos,
    bool? isLoading,
    String? error,
  }) {
    return TodoState(
      todos: todos ?? this.todos,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}