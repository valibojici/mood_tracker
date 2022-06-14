import 'package:flutter/material.dart';
import 'package:mood_tracker/model/Record.dart';
import 'package:mood_tracker/pages/breathing/BreathingExercise.dart';
import 'package:mood_tracker/pages/calendar/Calendar.dart';
import 'package:mood_tracker/pages/home/Home.dart';
import 'package:mood_tracker/pages/objectives/Todo.dart';
import 'package:mood_tracker/pages/objectives/TodoList.dart';
import 'package:mood_tracker/pages/quotes/Quotes.dart';
import 'package:mood_tracker/pages/settings/Settings.dart';
import 'package:mood_tracker/pages/statistics/Statistics.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cron/cron.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelKey: 'key1',
        channelName: 'Proto Coders Point',
        channelDescription: "Notification example",
        defaultColor: const Color(0XFF9050DD),
        ledColor: Colors.white,
        playSound: true,
        enableLights: true,
        enableVibration: true)
  ]);
  await Hive.initFlutter();
  Hive.registerAdapter(RecordAdapter());
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<Record>('journal');
  await Hive.openBox<Todo>('objectives');
  final cron = Cron();
  cron.schedule(Schedule.parse('0 18 * * *'), () async {
    print('Runs every Five seconds');
    notify();
  });
  runApp(const MoodTracker());
}

class MoodTracker extends StatefulWidget {
  static ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  static String themeNotifierType = "light";
  const MoodTracker({Key? key}) : super(key: key);

  @override
  State<MoodTracker> createState() => _MoodTrackerState();
}

class _MoodTrackerState extends State<MoodTracker> {
  void getThemeValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    setState(() {
      MoodTracker.themeNotifierType = prefs.getString('theme')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    getThemeValue();
    if (MoodTracker.themeNotifierType == "light") {
      MoodTracker.themeNotifier = ValueNotifier(ThemeMode.light);
    } else {
      MoodTracker.themeNotifier = ValueNotifier(ThemeMode.dark);
    }
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: MoodTracker.themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            initialRoute: '/home',
            routes: {
              '/home': (context) => const Home(),
              '/calendar': (context) => const Calendar(),
              '/statistics': (context) => const Statistics(),
              '/objectives': (context) => const TodoList(),
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

void notify() async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1,
          channelKey: 'key1',
          title: 'Reminder',
          body: 'Don\'t forget to fill in the calendar'));
}
