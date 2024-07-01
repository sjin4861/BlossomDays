import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drawer menu',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer menu'),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            print('Shopping cart button is clicked');
          },
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            print('Search button is clicked');
          },
        ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/user.png'),
                backgroundColor: Colors.white,
              ),
              otherAccountsPictures: const <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/pot.png'),
                  backgroundColor: Colors.white,
                ),
              ],
              accountName: const Text('Jun'),
              accountEmail: const Text('1234@pusan.ac.kr'),
              onDetailsPressed: (){
                print('arrow is clicked');
              },
              decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0)
                )
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.grey[850]),
              title: Text('Home'),
              onTap: (){
                print('Home is clicked');
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.grey[850]),
              title: Text('Settings'),
              onTap: (){
                print('Settings is clicked');
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.question_answer, color: Colors.grey[850]),
              title: Text('Q&A'),
              onTap: (){
                print('Q&A is clicked');
              },
              trailing: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}