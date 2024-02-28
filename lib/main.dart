// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import "package:flutter_application_1/pages/home_page.dart";
import "package:flutter_application_1/pages/login_page.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(), // commenting out due to default setting of routing to the home page
      themeMode: ThemeMode.light,
      theme: ThemeData(
        // primarySwatch: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(
              255, 77, 211, 232), // Set app bar color for light theme
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(
              255, 45, 45, 45), // Set app bar color for dark theme
        ),
      ),
      initialRoute: "/home",
      routes: {
        "/": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage(),
      },
    );
  }
}
