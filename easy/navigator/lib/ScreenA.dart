import 'package:flutter/material.dart';

void main() => runApp(ScreenA());

class ScreenA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScreenA'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Go to the ScreenB'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/b',
                );
              },
            ),
            ElevatedButton(
              child: Text('Go to the ScreenC'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/c',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}