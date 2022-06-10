import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

class PersonalityTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PersonalityTestState();
  }
}

class _PersonalityTestState extends State<PersonalityTest> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'Have you been feeling down, depressed, irritable or hopeless over the last two weeks?',
      'answers': [
        {'text': 'Not at all', 'score': 10},
        {'text': 'Several days', 'score': 5},
        {'text': 'More than half of the days', 'score': 3},
        {'text': 'Nearly every day', 'score': 1}
      ]
    },
    {
      'questionText': 'Have you had little interest or pleasure in doing things ?',
      'answers': [
        {'text': 'Not at all', 'score': 10},
        {'text': 'Several days', 'score': 5},
        {'text': 'More than half of the days', 'score': 3},
        {'text': 'Nearly every day', 'score': 1}
      ]
    },
    {
      'questionText': 'Have you had trouble falling asleep, staying asleep, or have you been sleeping too much ?',
      'answers': [
        {'text': 'Not at all', 'score': 10},
        {'text': 'Several days', 'score': 5},
        {'text': 'More than half of the days', 'score': 3},
        {'text': 'Nearly every day', 'score': 1}
      ]
    }
  ];

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
    
  }
  void _answerQuestion(int score) {
    setState(() {
      _questionIndex += 1;
    });

    _totalScore += score;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personality test', style: TextStyle(fontSize: 15)),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}