import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'red', 'score': 5},
        {'text': 'white', 'score': 20},
        {'text': 'yellow', 'score': 7}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'rabbit', 'score': 10},
        {'text': 'snake', 'score': 5},
        {'text': 'elephant', 'score': 7},
        {'text': 'lion', 'score': 20}
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'anirudh', 'score': 30},
        {'text': 'dev', 'score': 10},
        {'text': 'sharma', 'score': 10},
        {'text': 'god', 'score': 10}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalscore = 0;

  void _resetquiz() {
    setState(() {
      _questionIndex = 0;
      _totalscore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalscore += score;
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
        appBar:
            AppBar(backgroundColor: Color(0xff885566), title: Text('quiz app')),
        body: _questionIndex < _questions.length
            ? quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : results(_totalscore, _resetquiz),
      ),
    );
  }
}
