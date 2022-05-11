import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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
  final questions = const [
    {
      'question': 'What\'s you favourite color?',
      'answers': ['Black', 'Blue', 'Red', 'Green']
    },
    {
      'question': 'What\'s your favourite animal?',
      'answers': ['Dog', 'Cat', 'Horse', 'Hamster']
    },
    {
      'question': 'What\'s your favourite band?',
      'answers': [
        'The Killers',
        'Flux Pavilion',
        'Ellie Goulding',
        'Simian Mobile Disco'
      ]
    }
  ];

  int _questionIndex = 0;
  void _answerQuestion() {
    //wewnątrz tej funkcji umieszczam kod, który zmienia stan aplikacji, potem zostaje ona renderowana na nowo
    //sprawdzam warunek ilosci pytan, zeby nie przekroczyc indexu
    if (_questionIndex < questions.length) {
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
        body: Column(
          children: [
            //Przywoluje jedno pytanie z listy
            //wywoluje mapę - element z listy questions, o wybranym indeksie i kluczu 'question'
            Question(questions[_questionIndex]['question']),
            //generuje dynamicznie przyciski z odpowiedziami, w zaleznosci ile mam odpowiedzi.
            //pobiera odpowiedzi do listy i zwraca kazda odpowiedz w postaci przycisku
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
