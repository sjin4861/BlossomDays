import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Container Widget',
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Container Widget'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.red,
          width: 100,
          height: 100,
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          padding: EdgeInsets.all(30),
          child: Text('Hello World!'),
        ),
      )
    );
  }
}

