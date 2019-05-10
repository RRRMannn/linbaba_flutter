import 'package:flutter/material.dart';

class BottomSheetDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomSheetDemoState();
  }
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();

  //可以使用界面其他应用
  void _openBottomSheet() {
    _bottomSheetScaffoldKey.currentState.showBottomSheet((BuildContext context) {
      return BottomAppBar(
        child: Container(
          height: 90,
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              Icon(Icons.add_circle_outline),
              SizedBox(
                width: 16,
              ),
              Text('01:30/03:30'),
              Expanded(
                child: Text(
                  "Fix you - Coldplay",
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  //不能使用界面其他应用
  Future _openModelBottomSheet() async{
    final option = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context){
        return Container(
          height: 200,
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("Option A"),
                onTap: (){
                  Navigator.pop(context,"A");
                },
              ),
              ListTile(
                title: Text("Option B"),
                onTap: (){
                  Navigator.pop(context,"B");
                },
              ),
              ListTile(
                title: Text("Option C"),
                onTap: (){
                  Navigator.pop(context,"C");
                },
              ),
            ],
          ),
        );
      },
    );

    print(option);

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _bottomSheetScaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text("BottomSheetDemo"),
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
                FlatButton(
                  child: Text("Open BottomSheet"),
                  onPressed: _openBottomSheet,
                ),
                FlatButton(
                  child: Text("Model BottomSheet"),
                  onPressed: _openModelBottomSheet,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
