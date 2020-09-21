import 'package:flutter/material.dart';

class Row1 extends StatefulWidget {
  @override
  _Row1State createState() => _Row1State();
}

class _Row1State extends State<Row1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Column1"),
      ),
      body: Container(
        child: Row(
          children: [
            RaisedButton(
              onPressed: () {},
              child: Text("1"),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text("2"),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text("3"),
            ),
          ],
        ),
      ),
    );
  }
}
