import 'package:flutter/material.dart';

class Column2 extends StatefulWidget {
  @override
  _Column2State createState() => _Column2State();
}

class _Column2State extends State<Column2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Column1"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RaisedButton(onPressed: (){},
            child: Text("1"),
            ),
            RaisedButton(onPressed: (){},
              child: Text("2"),
            ),
            RaisedButton(onPressed: (){},
              child: Text("3"),
            ),
          ],
        ),
      ),
    );
  }
}
