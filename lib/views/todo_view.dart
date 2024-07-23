// lib/views/todo_view.dart

import 'package:flutter/material.dart';
import '../controllers/todo_controller.dart';
import '../models/todo_model.dart';

class TodoView extends StatefulWidget {
  @override
  _TodoViewState createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  final TodoController _controller = TodoController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _taskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.loadTodos().then((_) {
      setState(() {});
    });
  }

  void _addTodo() {
    if (_titleController.text.isNotEmpty && _taskController.text.isNotEmpty) {
      setState(() {
        _controller.addTodo(
          _titleController.text,
          _taskController.text,
        );
        _titleController.clear();
        _taskController.clear();
      });
    }
  }

  void _toggleTodoStatus(int index) {
    setState(() {
      _controller.toggleTodoStatus(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.grey,
      appBar: AppBar( backgroundColor: Colors.white24,
        elevation: 0,
        title: Text('Todo List',style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.w900),),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[

          Expanded(
            child: ListView.builder(
              itemCount: _controller.todos.length,
              itemBuilder: (context, index) {
                final todo = _controller.todos[index];
                return ListTile(
                  title: Text(todo.title,style:
                  TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20),),
                  subtitle: Text(todo.task,
                      style:TextStyle(color: Colors.white.withOpacity(.7))),
                  trailing: Checkbox(
                    value: todo.isDone,
                    onChanged: (_) {
                      _toggleTodoStatus(index);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                fillColor: Colors.white,filled: true
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _taskController,
              decoration: InputDecoration(
                labelText: 'Task',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
                  fillColor: Colors.white,filled: true
              ),

            ),
          ),
          ElevatedButton(
            onPressed: _addTodo,
            child: Text('Add Todo'),
          ),
        ],
      ),
    );
  }
}
