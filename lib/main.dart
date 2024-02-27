import "package:flutter/material.dart";
import "package:flutter_application_1/home_page.dart";

void main() {
  // ignore: prefer_const_constructors
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    

    // ignore: prefer_const_constructors
    return MaterialApp(
      // ignore: prefer_const_constructors
      home: HomePage(),
    );
  }
}
