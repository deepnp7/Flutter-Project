// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const int day = 30;
    const String name = "Zatch";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App "),
      ),
      body: Center(
        child: const Text("Welcome to $day days of Flutter by $name "),
      ),
      drawer: Drawer(),
    );
  }
}
