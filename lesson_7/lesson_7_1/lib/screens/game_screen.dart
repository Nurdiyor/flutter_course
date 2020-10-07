import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.red, Colors.blue, Colors.amber],
              ),
            ),
            margin: EdgeInsets.only(top: 25),
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: GestureDetector(
                    child: Icon(Icons.arrow_back),
                    onTap: () {
                      print("Back press");
                    },
                  ),
                  color: Colors.white,
                  height: 56,
                  width: 56,
                  margin: EdgeInsets.only(right: 8, top: 4, bottom: 4),
                ),
                Text(
                  "1",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(right: 8),
                  child: Row(
                    children: [
                      Container(
                        child: SvgPicture.asset('assets/dollar.svg'),
                        width: 30,
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Text(
                          "1",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Image.asset('assets/apple_1.png'),
                          margin: EdgeInsets.all(8),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(8),
                          child: Image.asset('assets/apple_1.png'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(8),
                          child: Image.asset('assets/apple_1.png'),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(8),
                          child: Image.asset('assets/apple_1.png'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 4),
                  height: 45,
                  width: 45,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text("A"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 4),
                  height: 45,
                  width: 45,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text("A"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 4),
                  height: 45,
                  width: 45,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text("A"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 4),
                  height: 45,
                  width: 45,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text("A"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 4),
                  height: 45,
                  width: 45,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text("A"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 4),
                  height: 45,
                  width: 45,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text("A"),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: GridView.count(
              shrinkWrap: true,
              primary: false,
              padding: EdgeInsets.all(16),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              crossAxisCount: 5,
              children: [
                RaisedButton(
                  onPressed: () {},
                  child: Text("G"),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text("G"),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text("G"),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text("G"),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text("G"),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text("G"),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text("G"),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text("G"),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text("G"),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text("G"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
