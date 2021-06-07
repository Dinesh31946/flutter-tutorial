import 'package:first_app/core/store.dart';
import 'package:first_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

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
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id!);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.remove(item.id!);
  }
}
