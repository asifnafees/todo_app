// lib/main.dart

import 'package:flutter/material.dart';
import 'views/todo_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List MVC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoView(),
    );
  }
}
