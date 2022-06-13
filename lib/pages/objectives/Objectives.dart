import 'package:flutter/material.dart';

import 'TodoList.dart';

class Objectives extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Objectives',
      home: new TodoList(),
    );
  }
}