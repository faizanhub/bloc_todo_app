part of 'todo_bloc.dart';

class TodoState extends Equatable {
  const TodoState({
    required this.todoList,
    required this.checkedTodoList,
    required this.isLoading,
  });

  final List<TodoItemModel> todoList;
  final List<TodoItemModel> checkedTodoList;
  final bool isLoading;


  factory TodoState.initial() => const TodoState(todoList: [], checkedTodoList: [], isLoading: false);

  TodoState copyWith({
    List<TodoItemModel>? todoList,
    List<TodoItemModel>? checkedTodoList,
    bool? isLoading,
  }) {
    return TodoState(
      todoList: todoList ?? this.todoList,
      checkedTodoList: checkedTodoList ?? this.checkedTodoList,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [todoList, checkedTodoList];
}
