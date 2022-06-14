import 'package:hive/hive.dart';

part 'Todo.g.dart';

@HiveType(typeId: 3)
class Todo {
  Todo({required this.name, required this.checked, required this.key});

  @HiveField(1)
  final String name;

  @HiveField(2)
  bool checked;

  @HiveField(3)
  final String key;
}
