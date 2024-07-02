import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Column Widget',
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
        title: Text('Column Widget'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Row(
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
                child: Text('Hello World1'),
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
                child: Text('Hello World2'),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Text('Hello World3'),
              ),
              // Container(
              //   width: double.infinity,
              //   height: 20,
              // )
            ],
          ),
        ),
      )
    );
  }
}

