import 'package:flutter/material.dart';
import 'QuizPage.dart';

class ScoreDisplay extends StatefulWidget {
  @override
  _ScoreDisplayState createState() => _ScoreDisplayState();
}

int score = 0;

int highScore = 0;

class _ScoreDisplayState extends State<ScoreDisplay> {
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);

  @override
  void initState() {
    loadHighScore().then((value) {
      setState(() {
        highScore = value;
      });
      highScore = (preferences.getInt('highScore') != null) ? preferences.getInt('highScore') : 0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    'Score: ',
                    style: optionStyle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    score.toString(),
                    style: optionStyle,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    'High Score: ',
                    style: optionStyle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    highScore.toString(),
                    style: optionStyle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}