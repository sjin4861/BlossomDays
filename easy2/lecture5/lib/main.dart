import 'package:flutter/material.dart';

import 'my_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            fontSize: 30,
            color: Colors.white
          )
        )
      ),
      home: MyPage(),
    );
  }
}