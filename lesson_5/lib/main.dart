import 'package:flutter/material.dart';
import 'package:lesson_5/bloc/theme_bloc.dart';
import 'package:lesson_5/pages/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: getTheme(snapshot.data),
          home: MainPage(),
        );
      },
      stream: themeBloc.themeStream,
    );
  }
}
