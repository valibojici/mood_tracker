import 'package:hive/hive.dart';

part 'Record.g.dart';

/*
  Asta ar fi o intrare in jurnal
  Chestiile astea cu Hive sunt legate de baza de date, ignorati le

  flutter packages pub run build_runner build
*/

@HiveType(typeId: 0)
class Record {
  @HiveField(0)
  DateTime data;

  @HiveField(1)
  int mood;

  @HiveField(2)
  List<String> emotions;

  @HiveField(3)
  String notes;

  Record(
      {required this.data,
      required this.mood,
      required this.emotions,
      required this.notes});
}
