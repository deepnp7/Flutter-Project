// ignore_for_file: unnecessary_null_comparison

import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  late CatalogModel _catalog;
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    if (!_itemIds.contains(item.id)) { // Prevent adding duplicates
      _itemIds.add(item.id);
    }
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
class AddMutation extends VxMutation<MyStore> {
  final Item catalog;

  AddMutation(this.catalog);

  @override
  perform() {
    // Check if cart is not null before accessing it
    store?.cart.add(catalog); // Use the add method instead of directly accessing _itemIds
  }
}