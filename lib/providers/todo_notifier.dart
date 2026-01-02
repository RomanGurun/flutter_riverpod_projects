import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';
import '../models/todo_state.dart';

class TodoNotifier extends StateNotifier {
  TodoNotifier() : super(TodoState(todos: []));

  void addTodo(String title) {
    final newTodo = Todo(
      id: DateTime.now().toString(),
      title: title,
    );

    state = state.copyWith(
      todos: [...state.todos, newTodo],
    );
  }

  void toggleTodo(String id) {
    state = state.copyWith(
      todos: state.todos.map((todo) {
        if (todo.id == id) {
          return todo.copyWith(completed: !todo.completed);
        }
        return todo;
      }).toList(),
    );
  }

  void removeTodo(String id) {
    state = state.copyWith(
      todos: state.todos.where((todo) => todo.id != id).toList(),
    );
  }

  Future loadTodos() async {
    state = state.copyWith(isLoading: true);

    await Future.delayed(Duration(seconds: 1));

    state = state.copyWith(
      isLoading: false,
      todos: [
        Todo(id: '1', title: 'Learn Riverpod'),
        Todo(id: '2', title: 'Build an app'),
      ],
    );
  }
}