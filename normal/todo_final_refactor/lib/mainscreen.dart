import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_final/add_task.dart';
import 'package:todo_final/todo_list.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> todoList = [];
  void addTodo({required String todoText}) {
    if (todoList.contains(todoText)) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Already exists"),
            content: const Text("This task is already exists"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Close"),
              ),
            ],
          );
        },
      );
      return;
    }
    setState(() {
      todoList.insert(0, todoText);
    });
    writeLocalData();
    Navigator.pop(context);
  }

  void writeLocalData() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('todoList', todoList);
  }

  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      todoList = (prefs.getStringList('todoList') ?? []).toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  
  Future showModal(){
    return showModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: SizedBox(
                  height: 250,
                  child: AddTask(
                    addTodo: addTodo,
                  ),
                ),
              );
            },
          );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Codingchef"),
            accountEmail: const Text("codingchefdev@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset("images/codingchef2.png"),
              ),
            ),
          ),
          ListTile(
            onTap: () {
              launchUrl(Uri.parse("https://www.youtube.com/@codingchef"));
            },
            leading: const Icon(Icons.youtube_searched_for_rounded),
            title: const Text("About me"),
          ),
          ListTile(
            onTap: () {
              launchUrl(Uri.parse("https://www.gmail.com"));
            },
            leading: const Icon(Icons.mail_outline_rounded),
            title: const Text("About me"),
          ),
          ListTile(
            onTap: () {
              launchUrl(Uri.parse("https://www."));
            },
            leading: const Icon(Icons.shape_line_outlined),
            title: const Text("Share"),
          ),
        ],
      )),
      appBar: AppBar(
        title: const Text("TODO App"),
        centerTitle: true,
      ),
      body: (todoList.isEmpty)
          ? const Center(
              child: Text(
                "No items on the list",
                style: TextStyle(fontSize: 20),
              ),
            )
          : TODO(todoList: todoList, writeLocalData: writeLocalData),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModal();
        },
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
