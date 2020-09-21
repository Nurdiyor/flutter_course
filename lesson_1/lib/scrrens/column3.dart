import 'package:flutter/material.dart';

class Column3 extends StatefulWidget {
  @override
  _Column3State createState() => _Column3State();
}

class _Column3State extends State<Column3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Column1"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RaisedButton(
              onPressed: () {},
              child: Text("1"),
            ),
            Container(
              height: 100,
              width: 200,
              child: RaisedButton(
                onPressed: () {},
                child: Text("2"),
              ),
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
