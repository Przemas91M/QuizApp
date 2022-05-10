import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(
    MyApp()); //tu mamy skrót, jezeli funkcja przyjmuje tylko jeden argument.

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int questionIndex = 0;
  void answerQuestion() {
    setState(() {
      questionIndex++;
    });
    print(questionIndex);
  }

  @override
  build(BuildContext context) {
    var questions = [
      'What\'s you favourite color?',
      'What\'s your favourite animal?',
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: Column(
          children: [
            Text(questions[questionIndex]),
            RaisedButton(
              child: Text('Answer1'),
              onPressed:
                  answerQuestion, //wprowadzam tutaj wskaźnik do funkcji. Jezeli wpiszę tu funkcję z nawiasami, zostanie ona wykonana.
            ), //jest to wycofane, ale nadal uzywane.
            RaisedButton(
              child: Text('Answer2'),
              onPressed: () => print(
                  'Answer 2 chosen!'), //moge od razu zdefiniowac i wykonac jednoliniowa funkcje
            ),
            RaisedButton(
              child: Text('Answer3'),
              onPressed: () {
                //..wykonuje tutaj operacje
                print('Answer 3 chosen!'); //funkcja wieloliniowa
              },
            ),
          ],
        ),
      ),
    );
  }
}
