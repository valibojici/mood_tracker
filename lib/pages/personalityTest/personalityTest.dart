import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
  
class PersonalityTest extends StatefulWidget {
  const PersonalityTest({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PersonalityTestState();
  }
}

class _PersonalityTestState extends State<PersonalityTest> {
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
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leadingWidth: 100,
          leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_left_sharp),
          label: const Text('Back'),
          style: ElevatedButton.styleFrom(
              elevation: 0, primary: Colors.transparent),
        ),
          title: const Text('Mood testing'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}