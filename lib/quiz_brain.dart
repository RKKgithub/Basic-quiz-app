import 'package:flutter/material.dart';
import 'ScorePage.dart';
import 'QuizPage.dart';

List<Questions> questionBank;

class Questions {
  String questionText;
  String questionAnswer;

  Questions({this.questionText, this.questionAnswer});
}

class QuizBrain {
  int _questionNO = 0;

  List<Questions> questionBank = [
    Questions(questionText: 'Is Flutter awesome?', questionAnswer: 'Yes'),
    Questions(questionText: 'Can fish walk?', questionAnswer: 'No'),
    Questions(
        questionText: 'Did Iron Man die in Endgame?', questionAnswer: 'Yes'),
    Questions(
        questionText: 'Are snowmen built from snow?',
        questionAnswer: 'Yes'),
    Questions(
        questionText: 'Are Oranges black in colour?', questionAnswer: 'No'),
    Questions(
        questionText: 'Is Independence Day celebrated on August 15?',
        questionAnswer: 'Yes'),
    Questions(
        questionText: 'Is Spider the official R&D club of NITT',
        questionAnswer: 'Yes'),
    Questions(
        questionText: 'Will/Did NITT reopen on May 18th?', questionAnswer: 'No'),
  ];

  void nextQuestion() {
    if (_questionNO < questionBank.length - 1) {
      _questionNO++;
    }
  }

  String getQuestionText() {
    return questionBank[_questionNO].questionText;
  }

  String getQuestionAnswer() {
    return questionBank[_questionNO].questionAnswer;
  }

  bool check(String answer) {
    if (questionBank[_questionNO].questionAnswer == answer) {
      return true;
    } else {
      return false;
    }
  }

  bool isFinished() {
    if (_questionNO == questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNO = 0;
    score = 0;
    checker = Icons.pets;
  }

  void increment() {
    score++;
  }

  void addNewQuestion({String que, String ans}) {
    Questions newQuestion = Questions(questionText: que, questionAnswer: ans);
    questionBank.add(newQuestion);
  }
}