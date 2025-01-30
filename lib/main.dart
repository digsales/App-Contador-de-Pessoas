import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// stless para criar automaticamente statelesswidget

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Pode entrar!",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "0",
            style: TextStyle(
              fontSize: 100,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: null,
                child: Text(
                  "Saiu",
                  style: TextStyle(
                    color: Colors.black
                  )
                ),
              ),
              TextButton(
                onPressed: null,
                child: Text(
                    "Saiu",
                    style: TextStyle(
                        color: Colors.black
                    )
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
