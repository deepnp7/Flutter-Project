import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalog_image.dart';
import "package:velocity_x/velocity_x.dart";
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:flutter_application_1/pages/home_detail_page.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(
                catalog: catalog,
                key: Key(catalog.id
                    .toString()), // Pass a key or use a unique key like this
              ),
            ),
          ),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(
            image: catalog.image,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
                catalog.desc.text
                    .textStyle(Theme.of(context).textTheme.bodySmall)
                    .make(),
                10.heightBox,
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "\$${catalog.price}"
                          .text
                          .bold
                          .xl
                          .make()
                          .pOnly(right: 16.0), // Added right padding for space
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyTheme.darkBluishColor,
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8.0), // Adjust padding
                        ),
                        child: Text(
                          "Add to Cart",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // Set the text color to black
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).white.rounded.square(140).make().py8();
  }
}
