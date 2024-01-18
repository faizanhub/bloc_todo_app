import 'package:bloc_todo_app/core/blocs/todo/todo_bloc.dart';
import 'package:bloc_todo_app/core/services/todo_services.dart';
import 'package:bloc_todo_app/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TodoBloc(TodoServices())..add(FetchTodosEvent())),
      ],
      child: MaterialApp(
        title: 'Bloc Todo App',
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          brightness: Brightness.dark,

          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
