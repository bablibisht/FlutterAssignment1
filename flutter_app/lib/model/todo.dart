class TodoList {
  List<Todo> todosList;

  TodoList({this.todosList});

  //named constructor
  factory TodoList.fromJson(List<dynamic> parsedJson) {

    List<Todo> todosList = new List<Todo>();
    todosList = parsedJson.map((i)=>Todo.fromJson(i)).toList();

    return new TodoList(todosList: todosList);
  }
}


class Todo{
  int userId;
  int id;
  String title;
  bool completed;

  Todo({this.userId, this.id, this.title, this.completed});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed']
    );
  }

}