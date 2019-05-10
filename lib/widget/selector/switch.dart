import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SwitchDemoState();
  }
}

class SwitchDemoState extends State<SwitchDemo> {
  bool _switchItemA = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("SwitchDemo"),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SwitchListTile(
              value: _switchItemA,
                  onChanged: (value){
                    setState(() {
                      _switchItemA=value;
                    });
                  },
              title: Text("Switch Item A"),
              subtitle: Text("Description"),
              secondary: Icon(_switchItemA?Icons.mood:Icons.mood_bad),
              selected: _switchItemA,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//                Icon(_switchItemA?Icons.mood:Icons.mood_bad),
//                Switch(
//                  value: _switchItemA,
//                  onChanged: (value){
//                    setState(() {
//                      _switchItemA=value;
//                    });
//                  },
//                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
