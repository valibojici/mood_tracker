import 'package:flutter/material.dart';
import 'package:mood_tracker/pages/objectives/Todo.dart';
import 'package:mood_tracker/pages/objectives/TodoItem.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TextEditingController _textFieldController = TextEditingController();
  List<Todo> _todos = <Todo>[];
  final Box<Todo> _todosBox = Hive.box<Todo>('objectives');

  @override
  void initState() {
    super.initState();
    _todos = _todosBox.values.cast<Todo>().toList();
  }

  void _handleTodoChange(Todo todo) {
    setState(() {
      todo.checked = !todo.checked;
    });
    _todosBox.put(todo.key, todo);
  }

  void _handleTodoDelete(Todo todo) {
    setState(() {
      _todos = _todos.where((element) => element.key != todo.key).toList();
    });
    _todosBox.delete(todo.key);
  }

  void _addTodoItem(String name) {
    setState(() {
      _todos.add(Todo(
          name: name,
          checked: false,
          key: DateTime.now().millisecondsSinceEpoch.toString()));
    });
    _todosBox.put(
        DateTime.now().millisecondsSinceEpoch.toString(), _todos.last);
    _textFieldController.clear();
  }

  Future<void> _displayDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // needs user to tap the button
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a new to-do item'),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: 'Type your new to-do'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                Navigator.of(context).pop();
                _addTodoItem(_textFieldController.text);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Objectives list'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: _todos.map((Todo todo) {
          return TodoItem(
            todo: todo,
            onTodoChanged: _handleTodoChange,
            onTodoDeleted: _handleTodoDelete,
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _displayDialog(),
          tooltip: 'Add Item',
          child: const Icon(Icons.add)),
    );
  }
}
