import 'package:flutter/material.dart';

class CheckboxDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CheckboxDemoState();
  }
}

class _CheckboxDemoState extends State<CheckboxDemo> {

  bool _checkboxItemA = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("CheckboxDemo"),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CheckboxListTile(
              value: _checkboxItemA,
              selected: _checkboxItemA,
              onChanged: (value) {
                setState(() {
                  _checkboxItemA = value;
                });
              },
              title: Text("checkbox item "),      //文字描述
              subtitle: Text("Description"),      //小字
              secondary: Icon(Icons.bookmark),    //图标
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//                Checkbox(
//                  value: _checkboxItemA,
//                  onChanged: (value) {
//                    setState(() {
//                      _checkboxItemA=value;
//                    });
//                  },
//                  activeColor: Colors.black,
//                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
