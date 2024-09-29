// ignore_for_file: unnecessary_null_comparison, deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:logging/logging.dart';

// Set up the logger
final _logger = Logger('ItemWidget');

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({required Key key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          _logger.info("${item.name} pressed");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price}",
          textScaleFactor: 1.5,
          style: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

void main() {
  // Configure logging level and output
  Logger.root.level = Level.ALL; // Adjust log level if needed
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Item Widget Example')),
        body: Center(
          child: ItemWidget(
            key: UniqueKey(),
            item: Item(
              name: 'Item 1',
              desc: 'A sample item description',
              image: 'https://example.com/item.png',
              price: 99.99,
              id: 1,
              color: '',
            ),
          ),
        ),
      ),
    );
  }
}
