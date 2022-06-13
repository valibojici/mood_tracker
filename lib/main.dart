import 'package:flutter/material.dart';
import 'package:mood_tracker/model/Record.dart';
import 'package:mood_tracker/pages/breathing/BreathingExercise.dart';
import 'package:mood_tracker/pages/calendar/Calendar.dart';
import 'package:mood_tracker/pages/home/Home.dart';
import 'package:mood_tracker/pages/objectives/TodoList.dart';
import 'package:mood_tracker/pages/quotes/Quotes.dart';
import 'package:mood_tracker/pages/settings/Settings.dart';
import 'package:mood_tracker/pages/statistics/Statistics.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cron/cron.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelKey: 'key1',
            channelName: 'Proto Coders Point',
            channelDescription: "Notification example",
            defaultColor: const Color(0XFF9050DD),
            ledColor: Colors.white,
            playSound: true,
            enableLights:true,
            enableVibration: true
        )
      ]
  );
  await Hive.initFlutter();
  Hive.registerAdapter(RecordAdapter());
  await Hive.openBox('journal');
  final cron = Cron();
  cron.schedule(Schedule.parse('0 18 * * *'), () async {
    print('Runs every Five seconds');
    notify();
  });
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

void notify() async{
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1,
          channelKey: 'key1',
          title:'Reminder',
          body: 'Don\'t forget to fill in the calendar'
      )
  );
}