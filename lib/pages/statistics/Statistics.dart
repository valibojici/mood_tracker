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
  Map <String, double> moodMap =
  {
    "Very sad" : 0,
    "Sad": 0,
    "Neutral": 0,
    "Happy" : 0,
    "Very happy": 0
  };
  static final List<Color> moodColors = [
    Colors.deepPurple,
    Colors.purple,
    Colors.blue,
    Colors.teal,
    Colors.green
  ];
  @override
  Widget build(BuildContext context) {
    Box records = Hive.box("journal");
    List<Record> L = records.values.cast<Record>().toList();
    int k = 7;
    int mn = max(L.length - k - 1, 0);
    for(int i = L.length - 1; i >= mn; i--)
      {
        switch(L[i].mood)
        {
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
    return Scaffold(
      appBar: AppBar(title: const Text("Statistics")),
      body: Center(
        child: PieChart(
          dataMap: moodMap,
          colorList: moodColors,
          centerText: "Moods",
          chartValuesOptions: const ChartValuesOptions(showChartValues: true, showChartValuesInPercentage: true),
      ),
    ));
  }
}
