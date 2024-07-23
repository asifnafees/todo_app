// lib/models/todo_model.dart

class Todo {
  String title;
  String task;
  bool isDone;

  Todo({
    required this.title,
    required this.task,
    this.isDone = false,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'],
      task: json['task'],
      isDone: json['isDone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'task': task,
      'isDone': isDone,
    };
  }

  void toggleDone() {
    isDone = !isDone;
  }
}
