// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({required Key key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 36.0, vertical: 30.0), // Add vertical padding
          child: Row(
            // Replaced ButtonBar with Row
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "\$${catalog.price}".text.bold.xl4.purple600.make(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyTheme.lightBluishColor, // Updated style
                  shape: const StadiumBorder(),
                ),
                child: "Add to Cart"
                    .text
                    .bold
                    .white
                    .make(), // Made text bold and black
              ).wh(130, 50),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Add padding to the image
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0), // Padding on top
                child: Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(catalog.image)
                      .box
                      .rounded
                      .padding(const EdgeInsets.all(
                          8.0)) // Add padding around the image
                      .make()
                      .h32(context),
                ),
              ),
              Expanded(
                child: VxArc(
                  height: 30.0,
                  arcType: VxArcType.convey, // Updated type to 'convex'
                  edge: VxEdge.top,
                  child: Container(
                    color: context.cardColor,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name.text.xl4
                            .color(MyTheme.lightBluishColor)
                            .bold
                            .make(),
                        catalog.desc.text
                            .textStyle(context.captionStyle)
                            .xl
                            .make(),
                        10.heightBox,
                        "Dolore et deserunt anim adipisicing non mollit sunt pariatur sunt.bvnbvbvvbnvnbvnbvnbvnbvnbvnbvbnvnbvnbvbvnbvbvnbvnbvnbvbvbvnbvbvvbv"
                            .text
                            .textStyle(context.captionStyle)
                            .make()
                            .p16()
                      ],
                    ).py32(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
