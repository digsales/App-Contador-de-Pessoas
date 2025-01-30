import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// stless para criar automaticamente statelesswidget

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // tirar a bandeira de debug do app
      home: HomePage(),
    );
  }
}

// stful para criar automaticamente statefulwidget

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    count--;
    print(count);
  }

  void increment() {
    count++;
    print(count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
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
            SizedBox(height: 32),
            Text(
              "$count",
              style: TextStyle(
                fontSize: 100,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: decrement,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.red,
                    fixedSize: const Size(100, 100),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  child: Text(
                    "Saiu",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(width: 32),
                TextButton(
                  onPressed: increment,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.green,
                    fixedSize: const Size(100, 100),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  child: Text(
                    "Entrou",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
