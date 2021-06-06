import 'package:first_app/models/catalog.dart';
import 'package:first_app/widgets/home_widgets/add_to_cart.dart';
import 'package:first_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: context.canvasColor,
        bottomNavigationBar: Container(
          color: context.canvasColor,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalog.price!}"
                  .text
                  .xl3
                  .color(context.accentColor)
                  .bold
                  .make(),
              AddToCart(catalog: catalog)
            ],
          ).p16(),
        ),
        body: Column(
          children: [
            Hero(
              tag: Key(catalog.id!.toString()),
              child: Image.network(catalog.image!),
            ).h40(context),
            Expanded(
              child: VxArc(
                height: 20.0,
                edge: VxEdge.TOP,
                arcType: VxArcType.CONVEY,
                child: SingleChildScrollView(
                  child: Container(
                    color: context.cardColor,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name!.text.xl2
                            .color(context.accentColor)
                            .bold
                            .make(),
                        catalog.desc!.text
                            .align(TextAlign.center)
                            .size(16)
                            .color(Colors.grey)
                            .make(),
                        10.heightBox,
                        "Amet vero elitr et eirmod diam ut at amet rebum sed. Voluptua erat no nonumy sea, dolor voluptua vero et sit. Kasd et takimata voluptua nonumy no elitr at sadipscing."
                            .text
                            .color(Colors.grey)
                            .make()
                            .pOnly(top: 15),
                      ],
                    ).p64(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
