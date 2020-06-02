import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/bloc/todo_bloc.dart';
import 'package:flutterapp/bloc/todo_event.dart';
import 'package:flutterapp/bloc/todo_state.dart';
import 'package:flutterapp/model/todo.dart';
import 'file:///C:/Users/bablibisht/Desktop/FlutterProjects/test/ExerciseLogin/flutter_app/lib/view/tododetail.dart';

class DashboardBloc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DashboardBloc();
}

class _DashboardBloc extends State<DashboardBloc> {
  TodoBloc _todoBloc;

  @override
  void initState() {
    super.initState();
    _todoBloc = BlocProvider.of<TodoBloc>(context);
    _todoBloc.add(FetchTodoEvent());
  }

  @override
  void dispose() {
    _todoBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        body: Container(
          child: BlocBuilder<TodoBloc, TodoState>(
            bloc: _todoBloc,
            builder: (context, state) {
              if (state is TodoInitialState) {
                return buildLoading();
              } else if (state is TodoLoadingState) {
                return buildLoading();
              } else if (state is TodoLoadedState) {
                return buildTodoList(state.todoData);
              } else if (state is TodoErrorState) {
                return buildErrorUi(state.message);
              }else{
                return Text('Something went wrong!!!');
              }
            },
          ),
        )
        );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildErrorUi(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget buildTodoList(List<Todo> todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Center(
            child: Card(
                child: Padding(
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('${todos[index].id}'),
                        SizedBox(
                          width: 15.0,
                        ),
                        Expanded(
                          child: Text('${todos[index].title}'),
                        ),
                        TodoStatus(
                          status: todos[index].completed,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(15.0))),
          ),
          onTap: () => navigateToDetail(todos[index]),
        );
      },
    );
  }

  void navigateToDetail(Todo selTodo) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => TodoDetail(),
        settings: RouteSettings(arguments: selTodo)));
  }
}

class TodoStatus extends StatelessWidget {
  final bool status;

  TodoStatus({this.status});

  @override
  Widget build(BuildContext context) {
    if (status) {
      return Icon(
        Icons.check,
        color: Colors.blue,
      );
    } else {
      return Icon(
        Icons.cancel,
        color: Colors.red,
      );
    }
  }
}
