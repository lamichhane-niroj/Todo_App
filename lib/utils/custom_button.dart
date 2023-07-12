import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({super.key, required this.text, required this.callBackFunction});

  final String text;
  void Function() callBackFunction;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: callBackFunction,
      color: Colors.grey[300],
      child: Text(text),
    );
  }
}
