import 'package:flutterapp/constants/api_constants.dart';
import 'package:flutterapp/model/todo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TodoRepository{

  Future<List<Todo>> getTodoList() async {
    var response = await http.get(APIConstant.todoUrl);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);  //List<dynamic>
      List<Todo> todoList = TodoList.fromJson(data).todosList;
      return todoList;
    } else {
      throw Exception();
    }
  }
}