import 'package:flutter/material.dart';
import 'package:lesson_8/screens/splash_screen.dart';
import 'package:lesson_8/utils/helper_metods.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
//        primarySwatch: Colors.blue,
      primaryColor: getColorFromHex("#222222"),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}