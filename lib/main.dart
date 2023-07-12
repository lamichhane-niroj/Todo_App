import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return const MaterialApp(
      title: 'TO-DO App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
