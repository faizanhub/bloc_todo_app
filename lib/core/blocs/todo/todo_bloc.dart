import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_todo_app/core/models/todo_item_model.dart';
import 'package:bloc_todo_app/core/services/todo_services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc(this.todoServices) : super(TodoState.initial()) {
    on<FetchTodosEvent>(_fetchTodosEvent);
    on<FavouriteEvent>(_favouriteEvent);
    on<CheckItemEvent>(_checkItemEvent);
    on<UnCheckItemEvent>(_unCheckItemEvent);
    on<DeleteEvent>(_deleteEvent);
  }

  final TodoServices todoServices;
  List<TodoItemModel> _todoList = [];
  List<TodoItemModel> _checkedTodoList = [];

  _fetchTodosEvent(FetchTodosEvent event, Emitter<TodoState> emit) async {
    emit(state.copyWith(isLoading: true));

    _todoList = await todoServices.fetchTodos();
    emit(state.copyWith(todoList: List.from(_todoList), isLoading: false));
    // state.copyWith(todoList: [...state.todoList, todoList]);
  }

  _favouriteEvent(FavouriteEvent event, Emitter<TodoState> emit) async {
    final index = _todoList.indexOf(event.todoItemModel);
    _todoList[index] = _todoList[index].copyWith(isFavourite: !_todoList[index].isFavourite);
    emit(state.copyWith(todoList: [..._todoList]));
  }

  _checkItemEvent(CheckItemEvent event, Emitter<TodoState> emit) async {
    _checkedTodoList.add(event.todoItemModel);
    emit(state.copyWith(checkedTodoList: [..._checkedTodoList]));

  }

  _unCheckItemEvent(UnCheckItemEvent event, Emitter<TodoState> emit) async {
    _checkedTodoList.remove(event.todoItemModel);
    emit(state.copyWith(checkedTodoList: [..._checkedTodoList]));

  }

  _deleteEvent(DeleteEvent event, Emitter<TodoState> emit) async {

    for(var item in _checkedTodoList){
      _todoList.remove(item);
    }
    _checkedTodoList.clear();

    emit(state.copyWith(checkedTodoList: [], todoList: [..._todoList]));


  }
}
