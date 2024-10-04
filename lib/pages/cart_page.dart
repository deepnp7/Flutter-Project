// ignore_for_file: unused_field, no_leading_underscores_for_local_identifiers, empty_statements, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Replace accentColor with colorScheme.secondary for compatibility
          VxConsumer<MyStore>(
            mutations: {RemoveMutation},
            builder: (context, store, _) {
              final CartModel _cart =
                  store.cart; // Use '!' if cart is guaranteed to be non-null

              return "\$${_cart.totalPrice}"
                  .text
                  .xl4
                  .color(context.theme.colorScheme.secondary)
                  .make();
            },
          ),
          
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "Buying not supported yet.".text.make(),
              ));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: context.theme.colorScheme.secondary, // Updated
              shape: StadiumBorder(), // Button shape remains the same
            ),
            child: "Buy".text.white.make(),
          ).w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use VxBuilder to listen for changes in MyStore
    return VxBuilder<MyStore>(
      mutations: {RemoveMutation}, // Specify which mutations to listen for
      builder: (context, store, status) {
        final CartModel _cart =
            store.cart; // Use '!' if cart is guaranteed to be non-null

        return _cart.items.isEmpty
            ? "Nothing to show in Cart".text.xl3.makeCentered()
            : ListView.builder(
                itemCount: _cart.items.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Icon(Icons.done),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: () => RemoveMutation(_cart.items[index]),
                  ),
                  title: _cart.items[index].name.text.make(),
                ),
              );
      },
    );
  }
}
