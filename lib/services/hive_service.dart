import 'package:hive_flutter/hive_flutter.dart';
import '../models/todo_model.dart';
class HiveService {
  static const String boxName = 'HiveBox';
  Future<void> init()async{
    await Hive.initFlutter();

    if(!Hive.isAdapterRegistered(0)){
      Hive.registerAdapter(TodoAdapter());
    }
    await Hive.openBox<Todo>(boxName);
  }

  Box<Todo> getTodoBox ()=> Hive.box<Todo>(boxName);





}
