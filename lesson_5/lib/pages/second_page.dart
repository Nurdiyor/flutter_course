import 'package:flutter/material.dart';
import 'package:lesson_5/tools/shared_pref.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController numberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      getNumber().then((value) => numberController.text="${value}");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: numberController..text,
              ),
            ),
            FlatButton(
              color: Colors.blue,
              onPressed: () {
                saveNumber(int.parse(numberController.text.toString().isEmpty?0:numberController.text.toString()));
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
