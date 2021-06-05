import 'package:first_app/models/catalog.dart';

class CartModel {
  //catalog Fields
  late CatelogModel _catalog;

  //collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  //Get catalog
  CatelogModel get catalog => _catalog;

  //Set catalog
  set catalog(CatelogModel newCatalog) {
    _catalog = newCatalog;
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getByID(id)).toList();

  //Get TOtal Price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price!);

  //Add Item
  void add(Item item) {
    _itemIds.add(item.id!);
  }

  //Remove Item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
