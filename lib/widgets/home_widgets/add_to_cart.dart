// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;

  const AddToCart({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBuilder(
      mutations: {AddMutation, RemoveMutation}, // Listen to AddMutation
      builder: (context, _, __) {
        final CartModel? _cart =
            (VxState.store as MyStore?)?.cart; // Use nullable type

        if (_cart == null) {
          return Container(); // Return an empty container if cart is null
        }

        bool isInCart = _cart.items.contains(catalog);

        return ElevatedButton(
          onPressed: () {
            if (!isInCart) {
              AddMutation(catalog); // Trigger the mutation
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: context.theme.colorScheme.secondary,
            shape: const StadiumBorder(),
          ),
          child: isInCart
              ? const Icon(Icons.done)
              : const Icon(CupertinoIcons.cart_badge_plus),
        );
      },
    );
  }
}
