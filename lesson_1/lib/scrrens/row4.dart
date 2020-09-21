import 'package:flutter/material.dart';

class Row4 extends StatefulWidget {
  @override
  _Row4State createState() => _Row4State();
}

class _Row4State extends State<Row4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Column1"),
      ),
      body: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: RaisedButton(
                onPressed: () {
                  print("Btn 1");
                },
                child: Text("1"),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 100,
                width: 200,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("2"),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: RaisedButton(
                onPressed: () {},
                child: Text("3"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
