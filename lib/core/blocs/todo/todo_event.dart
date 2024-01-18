part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class FetchTodosEvent extends TodoEvent {
  List<Object?> get props => [];
}

class FavouriteEvent extends TodoEvent {
  final TodoItemModel todoItemModel;

  FavouriteEvent(this.todoItemModel);

  List<Object?> get props => [todoItemModel];
}

class CheckItemEvent extends TodoEvent {
  final TodoItemModel todoItemModel;

  CheckItemEvent(this.todoItemModel);

  List<Object?> get props => [todoItemModel];
}

class UnCheckItemEvent extends TodoEvent {
  final TodoItemModel todoItemModel;

  UnCheckItemEvent(this.todoItemModel);

  List<Object?> get props => [todoItemModel];
}

class DeleteEvent extends TodoEvent {


  List<Object?> get props => [];
}

