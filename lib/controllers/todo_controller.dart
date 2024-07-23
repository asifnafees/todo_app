// lib/controllers/todo_controller.dart

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/todo_model.dart';

class TodoController {
  List<Todo> _todos = [];
  final String _storageKey = 'todo_list';

  List<Todo> get todos => _todos;

  Future<void> loadTodos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? todoListString = prefs.getString(_storageKey);
    if (todoListString != null) {
      List<dynamic> todoListJson = jsonDecode(todoListString);
      _todos = todoListJson.map((json) => Todo.fromJson(json)).toList();
    }
  }

  Future<void> saveTodos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> todoListJson = _todos.map((todo) => todo.toJson()).toList();
    prefs.setString(_storageKey, jsonEncode(todoListJson));
  }

  void addTodo(String title, String task) {
    _todos.add(Todo(
      title: title,
      task: task,
    ));
    saveTodos();
  }

  void toggleTodoStatus(int index) {
    _todos[index].toggleDone();
    saveTodos();
  }
}
