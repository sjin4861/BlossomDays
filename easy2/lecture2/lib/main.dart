import 'package:flutter/material.dart';

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
      home: ListViewPage(),
    );
  }
}

class ListViewPage extends StatefulWidget{
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  final List<String> titleList = [
    "pots1",
    "pots2",
    "pots3",
  ];
  final List<String> imageList = [
    "image/first.png",
    "image/second.png",
    "image/third.png",
  ];
  var descriptions = [
    'This is a description',
    'This is a description',
    'This is a description',
  ];

  void showPopUp(context, title, image, description) {
    double width = MediaQuery.of(context).size.width * 0.6;

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: width,
            height: 380,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    image,
                    width: 200,
                    height: 200,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(title),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    description,
                    maxLines: 3,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView.builder'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: titleList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              showPopUp(context, titleList[index], imageList[index  ], descriptions[index]);
            },
            child: Card(
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(imageList[index]),
                  ),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            titleList[index],
                            style: const TextStyle(
                                fontSize: 20
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: width,
                            child: Text(
                              descriptions[index],
                              style: const TextStyle(
                                  fontSize: 15,
                                  color : Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ],
              )
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('AlertDialog Title'),
                content: const Text('AlertDialog description'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
