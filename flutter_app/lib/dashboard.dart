import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/model/todo.dart';
import 'file:///C:/Users/bablibisht/Desktop/FlutterProjects/test/ExerciseLogin/flutter_app/lib/view/tododetail.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard>{

  Future<TodoList> futureTodoList;

  @override
  void initState() {
    super.initState();
    futureTodoList = getTodoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: FutureBuilder(
          future: futureTodoList,
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data.todos.length,
                    itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Center(
                        child: Card(
                            child: Padding(
                                child: Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('${snapshot.data.todos[index].id}'),
                                    SizedBox(width: 15.0,),
                                    Expanded(child: Text('${snapshot.data.todos[index].title}'),),
                                    TodoStatus(status: snapshot.data.todos[index].completed,),
                                  ],
                                ),
                                padding: EdgeInsets.all(15.0))

                        ),
                      ),
                      onTap: () => navigateToDetail(snapshot.data.todos[index]),
                    );

                      /*return ListTile(
                        title: Text('${snapshot.data.todos[index].title}'),
                      );*/
                    },);
              }
              else if(snapshot.hasError){
                return Text('Something went wrong. Please try Again',
                style: TextStyle(fontSize: 18.0));
              }
              return CircularProgressIndicator();
            },
        ),
      ),
    );
  }

  void navigateToDetail(Todo selTodo){
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => TodoDetail(),
        settings: RouteSettings(
          arguments: selTodo
        )));
  }

  Future<TodoList> getTodoList() async {
    final response = await http.get('http://jsonplaceholder.typicode.com/todos');

    if (response.statusCode == 200) {
      return TodoList.fromJson(json.decode(response.body));
    } else {
      throw Exception('API Fail');
    }
  }
}

class TodoStatus extends StatelessWidget{

  final bool status;

  TodoStatus({this.status});

  @override
  Widget build(BuildContext context) {
    if(status){
      return Icon(
          Icons.check,
        color: Colors.blue,
      );
    }else{
      return Icon(
          Icons.cancel,
        color: Colors.red,
      );
    }

  }



}