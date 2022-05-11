import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback callback;
  final String answerText;

  Answer(this.callback,
      this.answerText); //tu bedzie sie znajdowac odniesienie do konkretnej funkcji, ktora bede chcial wykonac

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
          color: Colors.blue.shade300,
          textColor: Colors.white,
          child: Text(answerText),
          onPressed: callback),
    );
  }
}
