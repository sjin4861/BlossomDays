import 'package:flutter/material.dart';

class TODO extends StatefulWidget {
  final List<String> todoList;
  final void Function() writeLocalData;
  const TODO({super.key, required this.todoList, required this.writeLocalData});

  @override
  _TODOState createState() => _TODOState();
}

class _TODOState extends State<TODO> {
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.todoList.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.startToEnd,
          background: Container(
            color: Colors.red,
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.check),
                )
              ],
            ),
          ),
          onDismissed: (direction) {
            setState(() {
              widget.todoList.removeAt(index);
            });
            widget.writeLocalData();
          },
          child: ListTile(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          widget.todoList.removeAt(index);
                        });
                        widget.writeLocalData();
                        Navigator.pop(context);
                      },
                      child: const Text("Task done!"),
                    ),
                  );
                },
              );
            },
            title: Text(widget.todoList[index]),
          ),
        );
      },
    );
  }
}
