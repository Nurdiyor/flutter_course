import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  int score;
  int time;

  InfoScreen(this.score, this.time);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scores"),
      ),
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 250,
            height: 50,
            child: Row(
              children: [
                Text("Scores: "),
                Text("${score}"),
              ],
            ),
          ),
          Container(
            width: 250,
            height: 50,
            child: Row(
              children: [
                Text("Time: "),
                Text("${timeFormat(time)}"),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  String timeFormat(int second) {
    String min = (second / 60).round() < 10
        ? '0${(second / 60).round()}'
        : '${(second / 60).round()}';
    String sec = (second - (second / 60).round() * 60) < 10
        ? '0${(second - (second / 60).round() * 60)}'
        : '${(second - ((second / 60).round() * 60))}';
    return '${min}:${sec}';
  }
}
