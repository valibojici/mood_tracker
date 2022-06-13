import 'package:flutter/material.dart';

import 'TodoList.dart';

class Objectives extends StatelessWidget {
  const Objectives({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Objectives',
      home: new TodoList(),
    );
  }
}