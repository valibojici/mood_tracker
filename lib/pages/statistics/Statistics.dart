import 'package:flutter/material.dart';

/*
  Aici ar fi ceva statistici, poate un grafic ceva
  O sa trebuiasca sa luam din baza de date cum s a simtit utilizatorul
*/

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Statistics")),
      body: const Center(
        child: Text(
            "Aici ar trebui sa fie ceva statistici, un pie chart/grafic ceva?"),
      ),
    );
  }
}
