import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/model/todo.dart';

class TodoDetail extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    Todo selTodo = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Detail'),
      ),
      body: Center(
        child: Text(selTodo.title),
      )
    );
  }

}

