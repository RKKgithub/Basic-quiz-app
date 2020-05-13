import 'package:flutter/material.dart';
import 'QuizPage.dart';
import 'ScorePage.dart';

void main() => runApp(Quizy());

class Quizy extends StatefulWidget {
  @override
  _QuizyState createState() => _QuizyState();

}

List<Widget> _widgetOptions = <Widget>[
  QuizPage(),
  ScoreDisplay(),
];

int selectedIndex = 0;

class _QuizyState extends State<Quizy> {

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Quizy!'),
        ),
        backgroundColor: Colors.grey.shade900,
        body: _widgetOptions[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.teal,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              title: Text('Quiz'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assessment),
              title: Text('Score'),
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}