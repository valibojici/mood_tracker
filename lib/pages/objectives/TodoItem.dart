import 'package:flutter/material.dart';
import 'package:mood_tracker/pages/objectives/Todo.dart';

class TodoItem extends StatelessWidget {
  TodoItem(
      {required this.todo,
      required this.onTodoChanged,
      required this.onTodoDeleted})
      : super(key: ObjectKey(todo));

  final Todo todo;
  final onTodoChanged;
  final onTodoDeleted;

  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTodoChanged(todo);
      },
      onLongPress: () => onTodoDeleted(todo),
      leading: CircleAvatar(
        child: Text(todo.name[0]),
      ),
      title: Text(todo.name, style: _getTextStyle(todo.checked)),
    );
  }
}
