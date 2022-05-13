import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';

import './quiz.dart';
import './result.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(
    MyApp()); //tu mamy skrót, jezeli funkcja przyjmuje tylko jeden argument.

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//podkreslnik na poczatku nazwy oznacza, ze dana zmienna jest prywatna
class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'question': 'What\'s you favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Blue', 'score': 5},
        {'text': 'Red', 'score': 3},
        {'text': 'Green', 'score': 1}
      ]
    },
    {
      'question': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Horse', 'score': 10},
        {'text': 'Hamster', 'score': 5},
        {'text': 'Cat', 'score': 3},
        {'text': 'Dog', 'score': 1}
      ]
    },
    {
      'question': 'What\'s your favourite band?',
      'answers': [
        {'text': 'The Killers', 'score': 10},
        {'text': 'Flux Pavilion', 'score': 5},
        {'text': 'Ellie Goulding', 'score': 3},
        {'text': 'Nellie Furtado', 'score': 1}
      ]
    }
  ];

  int _questionIndex = 0;
  int _totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    //wewnątrz tej funkcji umieszczam kod, który zmienia stan aplikacji, potem zostaje ona renderowana na nowo
    _totalScore += score;
    //sprawdzam warunek ilosci pytan, zeby nie przekroczyc indexu
    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex++;
      });
      print(_questionIndex);
    }
  }

  @override
  build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body:
            //rozdzielam bloki kodu na dwa widgety: Quiz i Result
            _questionIndex < _questions.length
                ? Quiz(
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex,
                    questions: _questions)
                : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
