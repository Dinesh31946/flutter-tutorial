import 'package:first_app/models/catalog.dart';
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
        appBar: AppBar(),
        backgroundColor: MyTheme.creamColor,
        bottomNavigationBar: Container(
          color: Colors.white,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalog.price!}".text.xl3.blueGray800.bold.make(),
              ElevatedButton(
                onPressed: () async {
                  await Future.delayed(Duration(seconds: 1));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      MyTheme.darkBluishColor,
                    ),
                    shape: MaterialStateProperty.all(StadiumBorder())),
                child: "Buy".text.make(),
              ).wh(100, 50),
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
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name!.text.xl2
                          .color(MyTheme.darkBluishColor)
                          .bold
                          .make(),
                      catalog.desc!.text.size(16).color(Colors.grey).make(),
                      10.heightBox,
                    ],
                  ).p64(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
