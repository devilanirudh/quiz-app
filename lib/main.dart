import 'package:flutter/material.dart';
import 'dart:async';

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
      'questionText': '“The report of my death was an exaggeration.”',
      'answers': [
        {'text': 'Napoleon I', 'score': 0},
        {'text': 'Ronald Reagan', 'score': 0},
        {'text': 'Elvis Presley', 'score': 0},
        {'text': 'Mark Twain', 'score': 10}
      ],
    },
    {
      'questionText':
          '“Ask not what your country can do for you; ask what you can do for your country.”',
      'answers': [
        {'text': 'Winston Churchill', 'score': 0},
        {'text': 'John F. Kennedy', 'score': 10},
        {'text': 'Joseph Stalin', 'score': 0},
        {'text': 'Marie-Antoinette', 'score': 0}
      ],
    },
    {
      'questionText':
          '“We didn’t land on Plymouth Rock; the rock was landed on us.”',
      'answers': [
        {'text': 'Charles Cornwallis', 'score': 0},
        {'text': 'Malcolm X', 'score': 10},
        {'text': 'Henry Ford', 'score': 0},
        {'text': 'Brigham Young', 'score': 0}
      ],
    },
    {
      'questionText':
          '“The world will little note, nor long remember, what we say here, but it can never forget what they did here.”',
      'answers': [
        {'text': 'Vince Lombardi', 'score': 0},
        {'text': 'Abraham Lincoln', 'score': 10},
        {'text': 'Benjamin Franklin', 'score': 0},
        {'text': 'Thomas Edison', 'score': 0}
      ],
    },
    {
      'questionText': '“Float like a butterfly, sting like a bee.”',
      'answers': [
        {'text': 'Jack the Ripper', 'score': 0},
        {'text': 'Muhammad Ali', 'score': 10},
        {'text': 'Sun Tzu', 'score': 0},
        {'text': 'Douglas MacArthur', 'score': 0}
      ],
    },
    {
      'questionText': 'God “does not play dice.”',
      'answers': [
        {'text': 'George Washington', 'score': 0},
        {'text': 'Albert Einstein', 'score': 10},
        {'text': 'Frank Sinatra', 'score': 0},
        {'text': 'Pope John Paul II', 'score': 0}
      ],
    },
    {
      'questionText': '“I don’t do drugs. I am drugs.”',
      'answers': [
        {'text': 'John Lennon', 'score': 0},
        {'text': 'Abraham Lincoln', 'score': 0},
        {'text': 'Benjamin Franklin', 'score': 0},
        {'text': 'Salvador Dalí', 'score': 10}
      ],
    },
    {
      'questionText': '“I came, I saw, I conquered.”',
      'answers': [
        {'text': 'Alexander the Great', 'score': 0},
        {'text': 'Abraham Lincoln', 'score': 0},
        {'text': 'Julius Caesar', 'score': 10},
        {'text': 'Dwight Eisenhower', 'score': 0}
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
      home: Container(
        constraints: const BoxConstraints.expand(),
        decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage("img.jpg"), fit: BoxFit.cover)),
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 50, 117, 104),
              title: Text('quiz app')),
          body: _questionIndex < _questions.length
              ? quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : results(_totalscore, _resetquiz),
        ),
      ),
    );
  }
}
