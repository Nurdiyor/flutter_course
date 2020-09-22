import 'package:flutter/material.dart';
import 'package:lesson_4/screens/game_screen.dart';

class EnterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 250,
            height: 50,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GameScreen()));
              },
              color: Colors.teal,
              child: Text(
                "New game",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                    letterSpacing: 2),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: Colors.teal, width: 2)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8, bottom: 8),
            width: 250,
            height: 50,
            child: RaisedButton(
              onPressed: () {},
              color: Colors.teal,
              child: Text(
                "About",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                    letterSpacing: 2),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: Colors.teal, width: 2)),
            ),
          ),
          Container(
            width: 250,
            height: 50,
            child: RaisedButton(
              onPressed: () {},
              color: Colors.teal,
              child: Text(
                "Settings",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                    letterSpacing: 2),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: Colors.teal, width: 2)),
            ),
          )
        ],
      ),
    ));
  }
}
