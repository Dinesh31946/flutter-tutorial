import 'package:first_app/core/store.dart';
import 'package:first_app/models/cart.dart';
import 'package:first_app/models/catalog.dart';
import 'package:first_app/utils/routes.dart';
import 'package:first_app/widgets/drawer.dart';
import 'package:first_app/widgets/home_widgets/catalog_header.dart';
import 'package:first_app/widgets/home_widgets/catalog_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // final catalogJson =
    //     await rootBundle.loadString("assets/files/catalog.json");
    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;

    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatelogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, items, _) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: context.theme.buttonColor,
          child: Icon(CupertinoIcons.cart, color: Colors.white),
        ).badge(
            color: Vx.white,
            size: 22,
            count: _cart.items.length,
            textStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      ),
      body: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: "Catalog App".text.bold.xl2.make(),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CatalogHeader(),
              Title(
                  color: Colors.blueGrey,
                  child: "Trending Products"
                      .text
                      .bold
                      .color(context.theme.buttonColor)
                      .make()
                      .pOnly(top: 10, left: 10)),
              if (CatelogModel.items != null && CatelogModel.items!.isNotEmpty)
                CatalogList().pOnly(top: 8).expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
          drawer: MyDrawer(),
        ),
      ),
    );
  }
}
