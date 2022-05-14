import 'package:flutter/material.dart';
import 'package:mood_tracker/pages/breathing/BreathingExercise.dart';
import 'package:mood_tracker/pages/calendar/Calendar.dart';
import 'package:mood_tracker/pages/home/Home.dart';
import 'package:mood_tracker/pages/objectives/Objectives.dart';
import 'package:mood_tracker/pages/quotes/Quotes.dart';
import 'package:mood_tracker/pages/settings/Settings.dart';
import 'package:mood_tracker/pages/statistics/Statistics.dart';

void main() {
  runApp(const MoodTracker());
}

class MoodTracker extends StatelessWidget {
  const MoodTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => const Home(),
        '/calendar': (context) => const Calendar(),
        '/statistics': (context) => const Statistics(),
        '/objectives': (context) => const Objectives(),
        '/quotes': (context) => const Quotes(),
        '/breathing': (context) => const BreathingExercise(),
        '/settings': (context) => const Settings(),
      },
      title: "Mood Tracker",
    );
  }
}
