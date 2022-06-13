import 'package:flutter/material.dart';
import 'package:mood_tracker/pages/objectives/Todo.dart';
import 'package:mood_tracker/pages/objectives/TodoItem.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => new _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TextEditingController _textFieldController = TextEditingController();
  final List<Todo> _todos = <Todo>[];

  void _handleTodoChange(Todo todo) {
	setState(() {
	  todo.checked = !todo.checked;
	});
  }
  void _addTodoItem(String name) {
	setState(() {
	  _todos.add(Todo(name: name, checked: false));
	});
	_textFieldController.clear();
  }

  Future<void> _displayDialog() async {
	return showDialog<void>(
	  context: context,
	  barrierDismissible: false, // needs user to tap the button
	  builder: (BuildContext context) {
	    return AlertDialog(
	      title: const Text('Add a new todo item'),
	      content: TextField(
	        controller: _textFieldController,
	        decoration: const InputDecoration(hintText: 'Type your new todo'),
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