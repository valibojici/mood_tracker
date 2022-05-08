import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mood_tracker/pages/calendar/Journal.dart';
import 'package:mood_tracker/pages/home/BottomHomeMenu.dart';

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
      "Aici am pune poate un mesaj cu 'hello how was your day' sau ceva de genul asta, eventual si un buton jos unde cand il apesi si te duce la ecranul cu jurnalul de azi",
      style: TextStyle(
        fontSize: 15,
      ),
    );

    IconButton journalButton = IconButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Journal(dataCurenta: DateTime.now())));
      },
      icon: Icon(
        FontAwesomeIcons.penToSquare,
      ),
      iconSize: 30,
    );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          textHome,
          SizedBox(
            height: 20,
          ),
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.green,
            child: journalButton,
          ),
        ],
      ),
      bottomNavigationBar: const BottomHomeMenu(),
    );
  }
}
