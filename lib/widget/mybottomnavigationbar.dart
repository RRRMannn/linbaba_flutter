import 'package:flutter/material.dart';
import 'package:linbaba_flutter/main.dart';

int currentIndex=0;

class MyBottomNavigationBar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyBottomNavigationBarState();
  }

}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar>{

  void _onTapHandler(int index){
    setState(() {
      currentIndex=index;
      debugPrint("$currentIndex");
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.black,                   //激活状态颜色
      currentIndex: currentIndex,                            //当前为第几项
      onTap: _onTapHandler,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          title: Text("Explore"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          title: Text("History"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          title: Text("List"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          title: Text("My"),
        ),
      ],
    );
  }

}