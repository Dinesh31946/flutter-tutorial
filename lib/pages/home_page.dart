import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String name = "Techinical Dinesh";
    return Scaffold(
      appBar: AppBar(
        title: Text("My First App"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to Flutter app by $name"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
