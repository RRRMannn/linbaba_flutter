import 'package:flutter/material.dart';
import 'package:linbaba_flutter/widget/buttons.dart';
import 'package:linbaba_flutter/widget/floatingbutton.dart';
import 'package:linbaba_flutter/widget/popupmenubutton.dart';

class MaterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("MaterialComponents"),
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          ListItem(
            title: "PopupMenuButton",
            page: PopupMenuButtonDemo(),
          ),
          ListItem(
            title: "Button",
            page: ButtonDemo(),
          ),
          ListItem(
            title: "FloatingActionButton",
            page: FloatingActionButtonDemo(),
          )
        ],
      ),
    );
  }
}

class _WidgeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("_WidgeDemo"),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[],
            )
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({this.title, this.page});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
