import 'package:flutter/material.dart';
import 'package:lesson_5/bloc/theme_bloc.dart';
import 'package:lesson_5/pages/second_page.dart';
import 'package:lesson_5/tools/shared_pref.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}


class _MainPageState extends State<MainPage> {

@override
  void initState() {
    super.initState();
    getTheme1().then((value){
      if(value==AppTheme.GreenLight.toString()){
        themeBloc.themeSink.add(AppTheme.GreenLight);
      }else{
        themeBloc.themeSink.add(AppTheme.GreenDark);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cache"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RaisedButton(
              onPressed: () {
                themeBloc.themeSink.add(AppTheme.GreenDark);
                saveTheme(ThemeData.dark());
              },
              child: Text("dark"),
            ),
            RaisedButton(
              onPressed: () {
                themeBloc.themeSink.add(AppTheme.GreenLight);
                saveTheme(ThemeData.light());
              },
              child: Text("light"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondPage()));
              },
              child: Text("Ok"),
            ),
          ],
        ),
      ),
    );
  }
}
