import 'package:flutter/material.dart';

/*
  Setari notificari? inca nu m am uitat cum se fac astea, nici eu nu stiu
*/

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: const Center(
        child: Text("Aici pentru setari, nu stiu daca mai facem asta"),
      ),
    );
  }
}
