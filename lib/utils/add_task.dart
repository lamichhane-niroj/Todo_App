import 'package:flutter/material.dart';
import 'package:todo/utils/custom_button.dart';

class TaskBox extends StatelessWidget {
  const TaskBox(
      {super.key,
      required this.c1,
      required this.c2,
      required this.c3,
      required this.c4,
      required this.callBackAction});

  // controllers
  final TextEditingController c1;
  final TextEditingController c2;
  final TextEditingController c3;
  final TextEditingController c4;
  final void Function() callBackAction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[200],
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      content: SizedBox(
        height: 330,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                controller: c1,
                decoration: InputDecoration(
                    hintText: 'Title of the task',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0))),
              ),
              TextField(
                controller: c2,
                decoration: InputDecoration(
                    hintText: 'Add a new task',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0))),
              ),
              TextField(
                controller: c3,
                decoration: InputDecoration(
                    hintText: 'Time to begin',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0))),
              ),
              TextField(
                controller: c4,
                decoration: InputDecoration(
                    hintText: 'Time to end',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton(text: "Save", callBackFunction: callBackAction),
                  const SizedBox(
                    width: 8.0,
                  ),
                  MyButton(
                    text: "Cancel",
                    callBackFunction: () => Navigator.pop(context),
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
