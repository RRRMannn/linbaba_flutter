import 'package:flutter/material.dart';

class SnackBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SnackBarDemoState();
  }
}

class SnackBarDemoState extends State<SnackBarDemo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("SnackBarDemo"),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SnackBarButton()
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SnackBarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FlatButton(
      child: Text("Open SnackBar"),
      onPressed: () {
        Scaffold.of(context).showSnackBar(
            SnackBar(
                content: Text("Processing…"),
                action: SnackBarAction(
                  label: "OK",
                  onPressed: () {},
                )
            )
        );
      },
    );
  }
}