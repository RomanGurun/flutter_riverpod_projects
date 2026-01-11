import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login/views/screens/todo_list_screen.dart';
import 'services/hive_service.dart';
import 'views/screens/todo_detail_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final hive = HiveService();
  await hive.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: const TodoListScreen(),
    );
  }
}
