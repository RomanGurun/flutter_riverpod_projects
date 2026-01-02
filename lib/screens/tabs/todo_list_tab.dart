import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/todo_provider.dart';

class TodoListTab extends ConsumerStatefulWidget {
  @override
  ConsumerState createState() => _TodoListTabState();
}

class _TodoListTabState extends ConsumerState {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(todoProvider.notifier).loadTodos());
  }

  @override
  Widget build(BuildContext context) {
    final todoState = ref.watch(todoProvider);
    final stats = ref.watch(todoStatsProvider);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Enter todo title',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        ref.read(todoProvider.notifier).addTodo(_controller.text);
                        _controller.clear();
                      }
                    },
                    child: Text('Add'),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Total: ${stats['total']}'),
                      Text('Completed: ${stats['completed']}'),
                      Text('Pending: ${stats['pending']}'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        if (todoState.isLoading)
          CircularProgressIndicator()
        else
          Expanded(
            child: ListView.builder(
              itemCount: todoState.todos.length,
              itemBuilder: (context, index) {
                final todo = todoState.todos[index];
                return ListTile(
                  leading: Checkbox(
                    value: todo.completed,
                    onChanged: (_) {
                      ref.read(todoProvider.notifier).toggleTodo(todo.id);
                    },
                  ),
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      decoration: todo.completed
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      ref.read(todoProvider.notifier).removeTodo(todo.id);
                    },
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}