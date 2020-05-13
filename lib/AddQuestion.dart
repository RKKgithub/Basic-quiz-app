import 'package:flutter/material.dart';
import 'QuizPage.dart';
import 'main.dart';

class AddQuestion extends StatefulWidget {
  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);

  String question;
  String answer;

  void onAdd(String q, String a) {
    if(q == null || a == null){
      Navigator.pop(context);
    }
    else {
      if (a == 'Yes' || a == 'No') {
        setState(() {
          quizBrain.addNewQuestion(que: q, ans: a);
        });
      }
      else if (a == 'yes' || a == 'YES') {
        setState(() {
          quizBrain.addNewQuestion(que: q, ans: 'Yes');
        });
      }
      else if (a == 'no' || a == 'NO') {
        setState(() {
          quizBrain.addNewQuestion(que: q, ans: 'No');
        });
      }
      else {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              textInputAction: TextInputAction.next,
              onChanged: (questionValue) {
                setState(() {
                  question = questionValue;
                });
              },
              decoration: InputDecoration(border: OutlineInputBorder(),
                  hintText: 'Enter Question'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              textInputAction: TextInputAction.next,
              onChanged: (answerValue) {
                setState(() {
                  answer = answerValue;
                });
              },
              decoration: InputDecoration(border: OutlineInputBorder(),
                  hintText: 'Enter Answer'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FlatButton(
              color: Colors.teal,
              child: Text('Add',
                style: optionStyle,),
              onPressed: () {
                onAdd(question, answer);
                setState(() {
                  selectedIndex = 0;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}