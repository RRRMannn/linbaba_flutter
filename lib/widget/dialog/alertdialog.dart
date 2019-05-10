import 'package:flutter/material.dart';

class AlertDialogDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AlertDialogDemoState();
  }
}

class AlertDialogDemoState extends State<AlertDialogDemo> {

  String _choice="Nothing";

  Future<void> _openAlertDialog() async{
    final choice  = await showDialog(
        context: context,
        barrierDismissible: false,      //点击空白不关闭Dialog
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("AlertDialog"),
            content: Text("Are you sure about this?"),
            actions: <Widget>[
              FlatButton(
                onPressed: (){
                  Navigator.pop(context,"Cancel");
                },
                child: Text("Cancel"),
              ),
              FlatButton(
                onPressed: (){
                  Navigator.pop(context,"Sure");
                },
                child: Text("Sure"),
              ),
            ],
          );
        });

    setState(() {
      _choice=choice;
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("AlertDialogDemo"),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Your choice is $_choice"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("Open AlertDialog"),
                  onPressed: _openAlertDialog,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
