import 'package:flutter/material.dart';

class Column1 extends StatefulWidget {
  @override
  _Column1State createState() => _Column1State();
}

class _Column1State extends State<Column1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Column1"),
      ),
      body: Container(
        child: Column(
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
