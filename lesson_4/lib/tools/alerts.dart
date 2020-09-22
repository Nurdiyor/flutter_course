import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:lesson_4/screens/info_screen.dart';

void showAwesomeDialog(
    BuildContext context, String title, String desc, int score, int time) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.SUCCES,
    animType: AnimType.SCALE,
    title: title,
    desc: desc,
    btnOkOnPress: () {
      Navigator.of(context).pop(true);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => InfoScreen(score, time)));
    },
  )..show();
}
