import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const int day = 30;
    const String name = "Zatch";
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Bar Title"),
        // ignore: prefer_const_constructors
        backgroundColor: Color.fromARGB(255, 12, 219, 223),
      ),
      body: Center(
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: const Text("Welcome to $day days of Flutter by $name "),
        ),
      ),
    );
  }
}
