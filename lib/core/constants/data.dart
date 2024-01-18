import 'package:bloc_todo_app/core/models/todo_item_model.dart';

class Data {


  static final List<TodoItemModel> todoList = List.generate(15, (index) => TodoItemModel(
    id: index,
    name: "Todo Item $index",
  ));
}