import 'package:flutter/material.dart';
import 'package:mood_tracker/pages/calendar/CalendarDays.dart';

/*
  Aici ma gandeam sa fie un calendar, unde fiecare zi e colorata in functie de moodul selectat
  in ziua aia (pe o scara de la 1 la 5 de ex), daca e prea complicat poate doar marcam ca in ziua
  s a ales un mood/s a completat jurnalul

  Nu stiu exact daca clasa asta ar trebui sa fie stateful, vedem cand facem

*/

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calendar")),
      body: CalendarDays(),
    );
  }
}
