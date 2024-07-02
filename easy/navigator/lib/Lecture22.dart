import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigator',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context2) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to the Second Page'),
          onPressed: () {
            Navigator.push(
              context2,
              MaterialPageRoute(builder: (_) => SecondPage()),
            );
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget{
  Widget build(BuildContext ctx){
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to the First Page'),
          onPressed: () {
            Navigator.pop(ctx);
          },
        ),
      ),
    );
  }
}


