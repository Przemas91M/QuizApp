import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final VoidCallback resetQuiz;

  Result(this.totalScore, this.resetQuiz);

  String get resultPhrase {
    String returnText = 'You did it!';
    if (totalScore <= 8) {
      returnText = 'You are awesome and innocent!';
    } else if (totalScore <= 12) {
      returnText = 'You are okay';
    } else if (totalScore <= 16) {
      returnText = 'You are strange!';
    } else {
      returnText = 'You are so bad :(';
    }
    return returnText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(
        child: Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ), //gdy nie mam wiecej pytan
      ),
      TextButton(
        style: TextButton.styleFrom(primary: Colors.blue[400]),
        onPressed: resetQuiz,
        child: Text('Restart Quiz'),
      )
    ]);
  }
}
