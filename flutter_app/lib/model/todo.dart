class TodoList {
  List<Todo> todos;

  TodoList({
    this.todos,
  });

  factory TodoList.fromJson(List<dynamic> parsedJson) {

    List<Todo> todos = new List<Todo>();
    todos = parsedJson.map((i)=>Todo.fromJson(i)).toList();

    return new TodoList(
        todos: todos
    );
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