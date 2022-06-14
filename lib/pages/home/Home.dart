import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:mood_tracker/pages/calendar/Journal.dart';
import 'package:mood_tracker/pages/home/BottomHomeMenu.dart';
import 'package:mood_tracker/pages/personalityTest/personalityTest.dart';

/*
  Aici ar fi pagina de home
  Eu ma gandeam sa avem un mesaj gen 'How was your day?' daca ziua asta nu e completata
  altfel ceva gen 'Hope you are feeling ok' idk
  Eventual si un buton care te duce sa completezi ziua curenta daca nu ai completat o deja
*/

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Text textHome = Text(
      "Hello, how was your day?",
      style: TextStyle(
        fontSize: 20,
      ),
    );

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            textHome,
            SizedBox(height: 20),

            TextButton(
              child: const Text('Take our personality test!'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PersonalityTest()));                             
        },
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomHomeMenu(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Journal(currentDate: DateTime.now())));
        },
        backgroundColor: Colors.green,
        child: const Icon(FontAwesomeIcons.penToSquare),
      ),
    );
  }
}
