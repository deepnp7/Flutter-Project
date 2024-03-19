// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import "package:flutter_application_1/pages/home_page.dart";
import "package:flutter_application_1/pages/login_page.dart";
import "package:flutter_application_1/utils/routes.dart";
import "package:google_fonts/google_fonts.dart";

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
        fontFamily: GoogleFonts.lato().fontFamily,
        primaryTextTheme: GoogleFonts.latoTextTheme(),
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
      initialRoute: MyRoutes.homeRoute ,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}
