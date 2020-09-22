import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lesson_4/tools/alerts.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<Color> colorList = List(16);
  int score = 0;
  int time = 0;
  Timer timer;
  List<int> numberList = [];

  int objectIndex = 15;

  @override
  void initState() {
    super.initState();
    loadView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Game 15"),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: Colors.teal,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Score",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${score}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    color: Colors.teal,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Time",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${timeFormat(time)}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 320,
              height: 320,
              child: GridView.count(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                crossAxisCount: 4,
                children: <Widget>[
                  RaisedButton(
                    child: Text(
                      '${numberList[0]}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.all(0),
                    color: colorList[0],
                    onPressed: () {
                      setState(() {
                        click(0);
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text(
                      '${numberList[1]}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.all(0),
                    color: colorList[1],
                    onPressed: () {
                      setState(() {
                        click(1);
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text(
                      '${numberList[2]}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.all(0),
                    color: colorList[2],
                    onPressed: () {
                      setState(() {
                        click(2);
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text(
                      '${numberList[3]}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.all(0),
                    color: colorList[3],
                    onPressed: () {
                      setState(() {
                        click(3);
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text(
                      '${numberList[4]}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.all(0),
                    color: colorList[4],
                    onPressed: () {
                      setState(() {
                        click(4);
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text(
                      '${numberList[5]}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.all(0),
                    color: colorList[5],
                    onPressed: () {
                      setState(() {
                        click(5);
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text(
                      '${numberList[6]}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.all(0),
                    color: colorList[6],
                    onPressed: () {
                      setState(() {
                        click(6);
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text(
                      '${numberList[7]}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.all(0),
                    color: colorList[7],
                    onPressed: () {
                      setState(() {
                        click(7);
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text(
                      '${numberList[8]}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.all(0),
                    color: colorList[8],
                    onPressed: () {
                      setState(() {
                        click(8);
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text(
                      '${numberList[9]}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.all(0),
                    color: colorList[9],
                    onPressed: () {
                      setState(() {
                        click(9);
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text(
                      '${numberList[10]}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.all(0),
                    color: colorList[10],
                    onPressed: () {
                      setState(() {
                        click(10);
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text(
                      '${numberList[11]}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.all(0),
                    color: colorList[11],
                    onPressed: () {
                      setState(() {
                        click(11);
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text(
                      '${numberList[12]}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.all(0),
                    color: colorList[12],
                    onPressed: () {
                      setState(() {
                        click(12);
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text(
                      '${numberList[13]}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.all(0),
                    color: colorList[13],
                    onPressed: () {
                      setState(() {
                        click(13);
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text(
                      '${numberList[14]}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.all(0),
                    color: colorList[14],
                    onPressed: () {
                      setState(() {
                        click(14);
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text(
                      '${numberList[15]}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.all(0),
                    color: colorList[15],
                    onPressed: () {
                      setState(() {
                        click(15);
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 50,
                    child: RaisedButton(
                      color: Colors.teal,
                      onPressed: () {
                        //finis
                      },
                      child: Text(
                        "Finish",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      margin: EdgeInsets.all(8),
                      height: 50,
                      color: Colors.teal,
                      child: RaisedButton(
                        color: Colors.teal,
                        onPressed: () {
                         setState(() {
                           restart();
                           loadView();
                         });
                        },
                        child: Text(
                          "Restart",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void loadView() {
    objectIndex = 15;
    numberList.clear();
    for (int i = 0; i < 16; i++) {
      colorList[i] = i < 15 ? Colors.teal : Colors.white;
      if (i < 15) {
        numberList.add(i + 1);
      }
    }
//    numberList.shuffle();
    numberList.add(16);
    time = 0;
    score = 0;
    startTimeout();
  }

  void click(int clickIndex) {
    if ((clickIndex - objectIndex).abs() == 1 ||
        (clickIndex - objectIndex).abs() == 4) {
      colorList[objectIndex] = Colors.teal;
      colorList[clickIndex] = Colors.white;

      int k = numberList[objectIndex];
      numberList[objectIndex] = numberList[clickIndex];
      numberList[clickIndex] = k;
      objectIndex = clickIndex;
      score++;
      check();
    }
  }

  void check() {
    bool checked = true;
    for (int i = 0; i < numberList.length; i++) {
      if (numberList[i] != i + 1) {
        checked = false;
        break;
      }
    }
    if (checked) {
      restart();
      showAwesomeDialog(context, "Congratulations ! ! !", "You are win",score,time);
    }
  }

  void restart() {
    timer.cancel();
    timer=null;
  }

  void startTimeout() {
//    Timer.run(() {});
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        time++;
      });
//      saveTime(time).then((value) => print(time.toString()));
    });
  }
  String timeFormat(int second){
    String min=(second/60).round()<10?'0${(second/60).round()}':'${(second/60).round()}';
    String sec=(second-(second/60).round()*60)<10?'0${(second-(second/60).round()*60)}':
    '${(second-((second/60).round()*60))}';
       return '${min}:${sec}';
  }
}
