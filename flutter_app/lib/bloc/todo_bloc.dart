import 'package:bloc/bloc.dart';
import 'package:flutterapp/bloc/todo_event.dart';
import 'package:flutterapp/bloc/todo_state.dart';
import 'package:flutterapp/model/todo.dart';
import 'package:flutterapp/repository/todo_repo.dart';
import 'package:meta/meta.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {

  TodoRepository repository;

  TodoBloc({this.repository});

  @override
  TodoState get initialState => TodoInitialState();

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is FetchTodoEvent) {
      yield TodoLoadingState();
      try {
        List<Todo> todoList = await repository.getTodoList();
        yield TodoLoadedState(todoData: todoList);
      } catch (e) {
        yield TodoErrorState(message: e.toString());
      }
    }
  }

}