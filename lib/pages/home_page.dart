// ignore_for_file: library_private_types_in_public_api, avoid_print, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Zatch";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    // Load the JSON file
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");

    // Decode the JSON file
    final decodedData = jsonDecode(catalogJson);

    // Extract the 'products' array from the decoded JSON
    var productsData = decodedData["products"];

    // Map the products data into Item objects and assign it to CatalogModel.items
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item)) // Use fromMap here
        .toList();

    // Trigger a UI update with setState
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)? ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: CatalogModel.items[index],
              key: UniqueKey(),
            );
          },
        ):const Center(child:CircularProgressIndicator()),
      ),
      drawer: const MyDrawer(),
    );
  }
}
