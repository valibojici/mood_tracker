import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../model/Record.dart';
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
  static final List<Color> moodColors = [
    Colors.deepPurple,
    Colors.purple,
    Colors.blue,
    Colors.teal,
    Colors.green
  ];
  int k = 7;
  static const int inf = 100000000;
  @override
  Widget build(BuildContext context) {
    Map<String, double> moodMap = {
      "Very sad": 0,
      "Sad": 0,
      "Neutral": 0,
      "Happy": 0,
      "Very happy": 0
    };
    Box records = Hive.box<Record>("journal");
    final endDay = DateTime.now();
    final startDay = DateTime.now().subtract(Duration(days: k));

    List<Record> L = records.values
        .cast<Record>()
        .where(
            (Record r) => r.data.isBefore(endDay) && r.data.isAfter(startDay))
        .toList();

    for (Record r in L) {
      switch (r.mood) {
        case 0:
          moodMap["Very sad"] = (moodMap["Very sad"]! + 1);
          break;
        case 1:
          moodMap["Sad"] = (moodMap["Sad"]! + 1);
          break;
        case 2:
          moodMap["Neutral"] = (moodMap["Neutral"]! + 1);
          break;
        case 3:
          moodMap["Happy"] = (moodMap["Happy"]! + 1);
          break;
        case 4:
          moodMap["Very happy"] = (moodMap["Very happy"]! + 1);
          break;
      }
    }
    var dropdownItems = [
      const DropdownMenuItem(child: Text("7 days"), value: 7),
      const DropdownMenuItem(child: Text("30 days"), value: 30),
      const DropdownMenuItem(child: Text("all days"), value: inf),
    ];
    void dropdownCallback(int? selected) {
      if (selected is int) {
        setState(() {
          k = selected;
        });
      }
    }

    return Scaffold(
        appBar: AppBar(title: const Text("Statistics")),
        body: Center(
            child: Column(children: <Widget>[
          DropdownButton(
              items: dropdownItems, onChanged: dropdownCallback, value: k),
          PieChart(
            dataMap: moodMap,
            colorList: moodColors,
            centerText: "Moods",
            chartValuesOptions: const ChartValuesOptions(
                showChartValues: true, showChartValuesInPercentage: true),
          )
        ])));
  }
}
