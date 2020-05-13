import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ScorePage.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'AddQuestion.dart';

QuizBrain quizBrain = QuizBrain();

IconData checker = Icons.pets;

int tempScore;

SharedPreferences preferences;

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

Future<int> loadHighScore() async {
  preferences  = await SharedPreferences.getInstance();
  if(preferences == null) {
    return 0;
  }
  else {
    return preferences.getInt('highScore');
  }
}

class _QuizPageState extends State<QuizPage> {
  String finalAnswer;

  bool buttonState = false;

  Future<bool> saveHighScore() async {
    preferences  = await SharedPreferences.getInstance();
    return await preferences.setInt('highScore', highScore);
  }

  setHighScore () {
    loadHighScore().then((value) {
      setState(() {
        highScore = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var _onClick;

    if (quizBrain.isFinished())  {
      if (buttonState) {
        _onClick = () {
          buttonState = false;

          if (quizBrain.check(finalAnswer)) {
            setState(() {
              checker = Icons.check;
              quizBrain.increment();
            });
          } else {
            setState(() {
              checker = Icons.clear;
            });
          }

          tempScore = score;

          if(tempScore > highScore) {
            setState(() {
              highScore = tempScore;
            });
            print(highScore);
            saveHighScore();
            setHighScore();
          }

          Future.delayed(const Duration(milliseconds: 1000), () {
            setState(() {
              Alert(
                context: context,
                title: 'Finished!',
                desc: 'You\'ve reached the end of the quiz. Your score is $score',
              ).show();
              quizBrain.reset();
            });
          });
        };
      }
    } else {
      if (buttonState) {
        _onClick = () {
          buttonState = false;

          if (quizBrain.check(finalAnswer)) {
            setState(() {
              checker = Icons.check;
              quizBrain.increment();
            });
          } else {
            setState(() {
              checker = Icons.clear;
            });
          }

          Future.delayed(const Duration(milliseconds: 500), () {
            setState(() {
              quizBrain.nextQuestion();
              checker = Icons.pets;
            });
          });
        };
      }
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                      textColor: Colors.white,
                      color: Colors.green,
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          finalAnswer = 'Yes';
                          buttonState = true;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                      color: Colors.red,
                      child: Text(
                        'No',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          finalAnswer = 'No';
                          buttonState = true;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Center(
                  child: Icon(
                    checker,
                    color: Colors.white,
                    size: 50,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FlatButton(
                color: Colors.blue,
                child: Text(
                  'Review and Next',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: _onClick,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FlatButton(
                color: Colors.blue,
                child: Text(
                  'Add new Question',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddQuestion()),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}