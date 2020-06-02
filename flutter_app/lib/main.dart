import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'file:///C:/Users/bablibisht/Desktop/FlutterProjects/test/ExerciseLogin/flutter_app/lib/view/dashboard_bloc.dart';
import 'package:flutterapp/bloc/todo_bloc.dart';
import 'file:///C:/Users/bablibisht/Desktop/FlutterProjects/test/ExerciseLogin/flutter_app/lib/view/login.dart';
import 'package:flutterapp/repository/todo_repo.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TestApp',
      home: BlocProvider(
        create: (context) => TodoBloc(repository: TodoRepository()),
        child: LoginScreen(),
      ),
    );
  }

}