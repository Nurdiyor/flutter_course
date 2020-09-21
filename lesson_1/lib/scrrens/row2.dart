import 'package:flutter/material.dart';

class Row2 extends StatefulWidget {
  @override
  _Row2State createState() => _Row2State();
}

class _Row2State extends State<Row2> {
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
