import "package:flutter/material.dart";

void main() {
  // ignore: prefer_const_constructors
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Center(
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: const Text("Welcome to 30 days of Flutter"),
          ),
        ),
      ),
    );
  }
}
