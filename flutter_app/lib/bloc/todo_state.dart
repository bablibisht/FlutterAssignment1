import 'package:flutterapp/model/todo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class TodoState extends Equatable {}

class TodoInitialState extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoLoadingState extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoLoadedState extends TodoState {

  final List<Todo> todoData;
  TodoLoadedState({@required this.todoData});

  @override
  List<Object> get props => [todoData];
}

class TodoErrorState extends TodoState {

  final String message;
  TodoErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}
