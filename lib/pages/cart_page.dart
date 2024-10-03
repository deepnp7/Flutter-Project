import 'package:flutter/material.dart';
// import 'package:flutter_application_1/widgets/themes.dart';
// import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context)
          .canvasColor, // Use theme's canvas color for background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Cart",
          style: TextStyle(
            color: Theme.of(context).appBarTheme.titleTextStyle?.color ??
                (Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black),
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
