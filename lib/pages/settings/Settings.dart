import 'package:flutter/material.dart';
import 'package:mood_tracker/main.dart';
/*
  Setari notificari? inca nu m am uitat cum se fac astea, nici eu nu stiu
*/

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  bool isSwitched =  false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Settings")),
        body: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Dark Mode", style: TextStyle(fontSize: 20),),
                  Switch(value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          MoodTracker.themeNotifier.value =
                          MoodTracker.themeNotifier.value == ThemeMode.light
                              ? ThemeMode.dark
                              : ThemeMode.light;
                          isSwitched = value;
                        });
                      }),
                ]
            )
        )
    );
  }
}
