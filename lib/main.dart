import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        color: Colors.deepPurpleAccent,
        alignment: Alignment.center,
        child: Text("Olá, mundo!"),
      ),
    );
  }
}

// stless para criar automaticamente
