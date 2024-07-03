import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scaffold Messenger'),
      ),
      body: HomeBody(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.thumb_up),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('좋아요가 추가 되었습니다'),
              duration: const Duration(seconds: 5),
              action: SnackBarAction(
                label: '취소',
                onPressed: () {
                  //ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdPage()),
                  );
                },
              ),
            ),
          );
        },
      )
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondPage()),
          );
        },
        child: const Text('go to second page'),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Text(
          "좋아요가 추가 되었습니다",
          style: TextStyle(
              fontSize: 30.0, color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ScaffoldMessenger(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Third Page'),
        ),
        body: Builder(
          builder: (context) {
            return Center( 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "좋아요를 취소하시겠습니까?",
                    style: TextStyle(
                        fontSize: 30.0, color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('좋아요가 취소 되었습니다'),
                          duration: const Duration(seconds: 5),
                        ),
                      );
                    }, 
                    child: Text("취소하기")
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
