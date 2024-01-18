import 'package:bloc_todo_app/core/blocs/todo/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Todo App"),
        actions: [
          SizedBox(width: 10,),
          BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              return state.checkedTodoList.isNotEmpty ? InkWell(
                  onTap: (){
                    context.read<TodoBloc>().add(DeleteEvent());

                  },
                  child: Icon(Icons.delete, color: Colors.red,)) : const SizedBox();
            },
          ),
          SizedBox(width: 10,),

        ],
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: state.todoList.length,
                          itemBuilder: (context, index) {
                            final item = state.todoList[index];
                            return Card(
                              child: ListTile(
                                leading: Checkbox(
                                    value:
                                    state.checkedTodoList.indexWhere((element) => element.id == item.id) != -1 ? true : false,
                                    onChanged: (value) {
                                      if (value!) {
                                        context.read<TodoBloc>().add(CheckItemEvent(item));
                                      } else {
                                        context.read<TodoBloc>().add(UnCheckItemEvent(item));
                                      }
                                    }),
                                title: Text(item.name),
                                trailing: GestureDetector(
                                    onTap: () {
                                      context.read<TodoBloc>().add(FavouriteEvent(item));
                                    },
                                    child: Icon(
                                      item.isFavourite ? Icons.favorite : Icons.favorite_border,
                                      size: 30,
                                    )),
                              ),
                            );
                          }))
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
