import 'package:flutter/material.dart';

enum Option{
  A,B,C
}

class SimpleDialogDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SimpleDialogDemoState();
  }
}

class SimpleDialogDemoState extends State<SimpleDialogDemo> {

  String _choice ="Nothing";

  Future<void> _openSimpleDialog() async {

    final option = await showDialog(
      context: context,
//      barrierDismissible: false,     //点击空白不关闭
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text("simpleDialog"),
          children: <Widget>[
            SimpleDialogOption(
              child: Text('Cancel'),
              onPressed: (){
                Navigator.pop(context,Option.A);
              },
            ),
            SimpleDialogOption(
              child: Text('Cancel'),
              onPressed: (){
                Navigator.pop(context,Option.B);
              },
            ),
            SimpleDialogOption(
              child: Text('Cancel'),
              onPressed: (){
                Navigator.pop(context,Option.C);
              },
            ),
          ],
        );
      },
    );

    switch(option){
      case Option.A:
        setState(() {
          _choice="A";
        });
        break;
      case Option.B:
        setState(() {
          _choice="B";
        });
        break;
      case Option.C:
        setState(() {
          _choice="C";
        });
        break;
    }

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('SimpleDialogDemo'),
          centerTitle: true,
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
                  Text("Your choic is $_choice")
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.format_list_numbered),
          onPressed: _openSimpleDialog,
        ));
  }
}
