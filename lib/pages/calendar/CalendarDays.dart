import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mood_tracker/model/Record.dart';
import 'package:mood_tracker/pages/calendar/Journal.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarDays extends StatefulWidget {
  const CalendarDays({Key? key}) : super(key: key);

  @override
  State<CalendarDays> createState() => _CalendarDaysState();
}

class _CalendarDaysState extends State<CalendarDays> {
  final _records = Hive.box<Record>('journal');
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(1970, 1, 1),
      lastDay: DateTime.utc(2100, 12, 31),
      focusedDay: _focusedDay,
      onDaySelected: (selectedDay, focusedDay) async {
        await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => Journal(currentDate: selectedDay)),
        );
        setState(() {
          _focusedDay = selectedDay;
        });
      },
      calendarStyle: const CalendarStyle(
        isTodayHighlighted: false,
      ),
      daysOfWeekVisible: false,
      availableCalendarFormats: const {CalendarFormat.month: "Month"},
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          String currentDate = DateFormat('dd-MM-yyyy').format(day);
          if (_records.containsKey(currentDate)) {
            return Container(
              decoration: BoxDecoration(
                color: Journal.moodColors[_records.get(currentDate)!.mood],
                shape: BoxShape.rectangle,
              ),
              child: Center(
                child: Text(
                  day.day.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          } else {
            return Center(child: Text(day.day.toString()));
          }
        },
      ),
    );
  }
}
