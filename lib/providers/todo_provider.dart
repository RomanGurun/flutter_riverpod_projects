import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';
import '../models/todo_state.dart';
import 'todo_notifier.dart';

final todoProvider = StateNotifierProvider((ref) {
  return TodoNotifier();
});

final completedTodosProvider = Provider<List>((ref) {
  final todoState = ref.watch(todoProvider);
  return todoState.todos.where((todo) => todo.completed).toList();
});

final todoStatsProvider = Provider<Map>((ref) {
  final todoState = ref.watch(todoProvider);
  final completed = todoState.todos.where((t) => t.completed).length;
  final pending = todoState.todos.length - completed;

  return {
    'total': todoState.todos.length,
    'completed': completed,
    'pending': pending,
  };
});