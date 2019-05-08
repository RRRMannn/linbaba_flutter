import 'package:flutter/material.dart';

class PopupMenuButtonDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PopupMenuButtonDemoState();
  }
}

class PopupMenuButtonDemoState extends State<PopupMenuButtonDemo>{

  String _curentValue="Home";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("PopupMenuButtonDemo"),
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
                Text(_curentValue),
                PopupMenuButton(
                  onSelected: (value){
                    print(value);
                    setState(() {
                      _curentValue=value;
                    });
                  },
                  itemBuilder: (BuildContext context)=>[
                    PopupMenuItem(
                      value: 'Home',
                      child: Text("Home"),
                    ),
                    PopupMenuItem(
                      value: 'Discover',
                      child: Text("Discover"),
                    ),
                    PopupMenuItem(
                      value: 'Community',
                      child: Text("Community"),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}