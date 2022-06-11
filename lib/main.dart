import 'package:flutter/material.dart';
import 'package:mood_tracker/model/Record.dart';
import 'package:mood_tracker/pages/breathing/BreathingExercise.dart';
import 'package:mood_tracker/pages/calendar/Calendar.dart';
import 'package:mood_tracker/pages/home/Home.dart';
import 'package:mood_tracker/pages/objectives/Objectives.dart';
import 'package:mood_tracker/pages/quotes/Quotes.dart';
import 'package:mood_tracker/pages/settings/Settings.dart';
import 'package:mood_tracker/pages/statistics/Statistics.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(RecordAdapter());
  await Hive.openBox('journal');
  runApp(const MoodTracker());
}

class MoodTracker extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);
  const MoodTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __){
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
            themeMode: currentMode,
            theme: ThemeData(),
            darkTheme: ThemeData.dark(),
            title: "Mood Tracker",
          );
        });
  }
}
