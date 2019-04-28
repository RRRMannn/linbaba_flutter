import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyBottomNavigationBarState();
  }

}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar>{
  int _currentIndex=0;

  void _onTapHandler(int index){
    setState(() {
      _currentIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.black,                   //激活状态颜色
      currentIndex: _currentIndex,                            //当前为第几项
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