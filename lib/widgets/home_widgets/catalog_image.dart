import 'package:first_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    )
        .box
        .rounded
        .p20
        .color(MyTheme.creamColor)
        .make()
        .p16()
        .w40(context)
        .h20(context);
  }
}
