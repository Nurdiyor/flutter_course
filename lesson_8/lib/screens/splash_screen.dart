import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lesson_8/screens/home_screen.dart';
import 'package:lesson_8/utils/helper_metods.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: getColorFromHex("#222222"),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "My title",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                  fontFamily: 'Secular',
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "POWERED BY MICROSTAR",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Secular',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() {
    var duration = Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
