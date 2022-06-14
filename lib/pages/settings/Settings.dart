import 'package:flutter/material.dart';
import 'package:mood_tracker/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
/*
  Setari notificari? inca nu m am uitat cum se fac astea, nici eu nu stiu
*/

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

addStringToSF(String s) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('theme', s);
}

class _SettingsState extends State<Settings> {

  bool isSwitched =  MoodTracker.themeNotifier.value == ThemeMode.light
      ? false
      : true;
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
                          if (MoodTracker.themeNotifier.value == ThemeMode.light)
                            {
                                addStringToSF("light");
                            }
                          else
                            {
                              addStringToSF("dark");
                            }
                          isSwitched = value;
                        });
                      }),
                ]
            )
        )
    );
  }
}
