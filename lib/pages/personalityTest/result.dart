import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultText {
    String text;
    if (resultScore < 4) {
      text = 'You are healthy and happy!';
    } else if (resultScore < 15) {
      text = 'You might need some help!';
    } else {
      text = 'You are in a critical state!';
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              resultText,
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 32,
              ),
              textAlign: TextAlign.center,
            ),
            TextButton(
              child: Text('Restart Quiz'),
              onPressed: resetQuiz(),
            )
          ],
        ),
      ),
    );
  }
}