import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_screen.dart';

void main(){
  runApp(const MyApp());


}

class MyApp extends StatefulWidget {
  const new({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color.fromARGB(255, 1, 19, 34)
      ),
      home: HomeScreen()
    );
  }
}

