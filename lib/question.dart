import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText); //konstruktor klasy, przyjmuje jeden argument

  @override
  Widget build(BuildContext context) {
    //zwracana jest klasa z tekstem wpisywanym w konstruktorze
    //mozemy tu ja sobie formatowac i nie trzeba bedzie tego robic za kazdym razem w glownej klasie
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10), //all oznacza margines wokol calego kontenera
      child: Text(
        questionText,
        style: TextStyle(
          fontSize: 28,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
