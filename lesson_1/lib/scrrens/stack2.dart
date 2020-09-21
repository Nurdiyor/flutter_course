import 'package:flutter/material.dart';

class Stack2 extends StatefulWidget {
  @override
  _Stack2State createState() => _Stack2State();
}

class _Stack2State extends State<Stack2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Column1"),
      ),
      body: Container(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 90,
                height: 90,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
