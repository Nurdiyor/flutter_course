import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void showAwesomeDialog(BuildContext context, String title, String desc) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.SUCCES,
    animType: AnimType.SCALE,
    title: title,
    desc: desc,
    btnOkOnPress: () {
//      Navigator.of(context).pop(true);
    },
  )..show();
}
