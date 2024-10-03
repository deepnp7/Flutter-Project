// ignore_for_file: library_private_types_in_public_api, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;

  const AddToCart(
      {super.key, required this.catalog}); // Super parameter for Key

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          isInCart = isInCart.toggle();
          final _catalog = CatalogModel();
        }
        setState(() {});

        final _catalog = CatalogModel();

        _cart.catalog = _catalog;
        _cart.add(widget.catalog);
        setState(() {});
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:
            context.theme.colorScheme.secondary, // Updated for compatibility
        shape: const StadiumBorder(),
      ),
      child: isInCart
          ? const Icon(Icons.done)
          : Icon(Icons.add_shopping_cart_outlined),
    );
  }
}
