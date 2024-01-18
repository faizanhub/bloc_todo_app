
import 'package:bloc_todo_app/core/constants/data.dart';
import 'package:bloc_todo_app/core/models/todo_item_model.dart';

class TodoServices {
  
    Future<List<TodoItemModel>> fetchTodos() async {
    
    await Future.delayed(Duration(seconds: 2));

    return Data.todoList;
    // return List
  }
}