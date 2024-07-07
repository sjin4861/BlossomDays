import 'package:flutter/material.dart';
import 'package:lecture3/pot_page.dart';
import 'model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ListView builder & Dialog',
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget{
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final List<String> nameList = [
    "pots1",
    "pots2",
    "pots3",
  ];
  final List<String> imageList = [
    "image/first.png",
    "image/second.png",
    "image/third.png",
  ];
  final List<String> descriptions = [
    'This is a pot1',
    'This is a pot2',
    'This is a pot3',
  ];

  List<Pot> potData = [];
  
  @override
  void initState() {
    super.initState();
    potData = List.generate(3, (index) => Pot(name: nameList[index], image: imageList[index], description: descriptions[index]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: potData.length,
        itemBuilder: (context, int index) {
          return Card(
              child: ListTile(
                leading: Image.asset(
                  potData[index].image,
                  width: 50,
                  height: 50,
                ),
                title: Text(potData[index].name),
                subtitle: Text(potData[index].description),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PotPage(pot: potData[index]),
                  )); 
                },
              ),
            );
          }
         ),
      );
    }
}
