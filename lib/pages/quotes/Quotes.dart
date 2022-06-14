import 'package:flutter/material.dart';

/*
  Aici ar fi citatele, pe astea le luam din baza de date
  Eventual mai analizam si cum s a simtit utilizatorul si alegem ce citate sa i dam

*/

class Quotes extends StatefulWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quotes")),
      body: const Center(
        child: Text(
            "Aici ar trebui sa fie citatele, probabil le incarcam din baza de date"),
      ),
    );
  }
}
