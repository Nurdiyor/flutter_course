import 'package:flutter/material.dart';
import 'package:lesson_5/bloc/theme_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<int> saveNumber(int number) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt("NUMBER", number);
  return number;
}

Future<int> getNumber() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int number = prefs.getInt("NUMBER");
  if (number == null) {
    return 0;
  } else
    return number;
}

Future<String> saveTheme(ThemeData theme) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (theme == ThemeData.light())
    prefs.setString('THEME', AppTheme.GreenLight.toString());
  else
    prefs.setString('THEME', AppTheme.GreenDark.toString());
  return theme.toString();
}

Future<String> getTheme1() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return int
  String theme = prefs.getString('THEME');
  if (theme == null)
    return AppTheme.GreenLight.toString();
  else
    return theme;
}
