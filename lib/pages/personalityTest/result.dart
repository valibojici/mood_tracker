import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function() resetHandler;

  const Result(this.resultScore, this.resetHandler, {Key? key}) : super(key: key);

  String get resultPhrase {
    String resultText;
    if (resultScore >= 20) {
      resultText = 'You are quite happy!';
    } else if (resultScore >= 10) {
      resultText = 'You might be a little sad...';
    } else if (resultScore >= 5) {
      resultText = 'Your sadness is too much to handle!';
    } else {
      resultText = 'You are as sad as you can be :(';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: const Text(
              'Restart Quiz!',
            ),
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}