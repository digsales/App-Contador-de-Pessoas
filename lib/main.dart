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
  int inTotal = 0; // Total de clientes do dia
  int capacity = 15; // Altere a capacidade do ambiente

  void decrement() {
    if (count > 0) {
      setState(() {
        count--;
      });
      print(count);
    } else {
      print("Já está zerado!");
    }
  }

  void increment() {
    if (count < capacity) {
      setState(() {
        count++;
        inTotal++;
      });
      print(count);
    } else {
      print("Já está lotado!");
    }
  }

  void reset() {
    setState(() {
      count = 0;
      inTotal = 0;
    });
  }

  confirmAlert() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Tem certeza?"),
        content: Text("Está ação irá zerar ambos contadores."),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text("Cancelar", style: TextStyle(color: Colors.grey))),
          TextButton(
            onPressed: () => {
              reset(),
              Navigator.of(context).pop(false),
            },
            child: Text("Confirmar", style: TextStyle(color: Colors.red)),
          )
        ],
      ),
    );
  }

  bool get isEmpty => count == 0;

  bool get isFull => count == capacity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "Total de clientes:",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 32),
            Text(
              "$inTotal",
              style: TextStyle(
                fontSize: 100,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 32),
            Text(
              isFull ? "Lotado!" : "Clientes no ambiente:",
              style: TextStyle(
                fontSize: 30,
                color: isFull ? Colors.red : Colors.white,
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
            SizedBox(height: 32),
            TextButton(
              onPressed: confirmAlert,
              style: TextButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.black,
                fixedSize: const Size(100, 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
              child: Text(
                "ZERAR",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
