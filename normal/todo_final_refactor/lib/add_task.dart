import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  final void Function({required String todoText}) addTodo;
  const AddTask({super.key, required this.addTodo});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var todoText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Add task"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            autofocus: true,
            onSubmitted: (value) {
              if (todoText.text.isNotEmpty) {
                widget.addTodo(todoText: todoText.text);
              }
              todoText.clear();
            },
            controller: todoText,
            decoration: const InputDecoration(hintText: "Add task"),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (todoText.text.isNotEmpty) {
              widget.addTodo(todoText: todoText.text);
            }
            todoText.clear();
          },
          child: const Text("Add"),
        )
      ],
    );
  }
}
