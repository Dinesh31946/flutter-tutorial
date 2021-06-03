import 'package:first_app/models/catelog.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 2.0,
        horizontal: 12,
      ),
      child: Card(
        child: ListTile(
          leading: Image.network(item.image!),
          title: Text(item.name!),
          subtitle: Text(item.desc!),
          trailing: Text(
            "\$${item.price!}",
            textScaleFactor: 1.1,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
