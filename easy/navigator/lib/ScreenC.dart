import 'package:flutter/material.dart';

void main() => runApp(ScreenC());

class ScreenC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScreenC'),
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