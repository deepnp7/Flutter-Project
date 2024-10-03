// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import "package:flutter_application_1/core/store.dart";
import "package:flutter_application_1/models/cart.dart";
import "package:flutter_application_1/models/catalog.dart";
import "package:flutter_application_1/pages/cart_page.dart";
import "package:flutter_application_1/pages/home_page.dart";
import "package:flutter_application_1/pages/login_page.dart";
import "package:flutter_application_1/utils/routes.dart";
import "package:flutter_application_1/widgets/themes.dart";
import "package:velocity_x/velocity_x.dart";

void main() {
  // Create instances of CatalogModel and CartModel
  CatalogModel catalog = CatalogModel(); // Initialize the catalog
  CartModel cart = CartModel(); // Initialize the cart

  runApp(
    VxState(
      store: MyStore(catalog, cart), // Pass the instances as arguments
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
