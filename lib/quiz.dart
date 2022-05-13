import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;
  //zmienne w klamerkach sa zmiennymi dynamicznymi, posluguje sie ich nazwami a nie umiejscowieniem
  Quiz(
      {required this.answerQuestion,
      required this.questions,
      required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Przywoluje jedno pytanie z listy
        //wywoluje mapę - element z listy questions, o wybranym indeksie i kluczu 'question'
        Question(questions[questionIndex]['question'] as String),
        //generuje dynamicznie przyciski z odpowiedziami, w zaleznosci ile mam odpowiedzi.
        //pobiera odpowiedzi do listy i zwraca kazda odpowiedz w postaci przycisku
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerQuestion(answer['score']), answer['text'] as String);
        }).toList()
      ],
    );
  }
}
