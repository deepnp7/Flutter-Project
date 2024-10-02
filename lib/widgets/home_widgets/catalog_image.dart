
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String? image;

  const CatalogImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image ?? '',
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.error);
      },
    ).box.rounded.p8.color(MyTheme.creamColor).make().p16().w40(context);
  }
}
