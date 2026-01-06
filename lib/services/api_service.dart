import '../models/todo_model.dart';

class ApiService {
  Future<List<Todo>> fetchRemoteTodos() async {
    await Future.delayed(Duration(seconds: 1));

    return [
      Todo(id: '1', title: 'Connect to Hive', subtitle: 'Setup local hive '),
      Todo(
        id: '2',
        title: 'Implement MVVM',
        subtitle: 'Separate UI from a logic layer',
      ),
    ];
  }
}
