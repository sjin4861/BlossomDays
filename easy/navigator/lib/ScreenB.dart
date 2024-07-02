import 'package:flutter/material.dart';

void main() => runApp(ScreenB());

class ScreenB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScreenB'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to the ScreenA'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}