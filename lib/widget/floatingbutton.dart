import 'package:flutter/material.dart';

class FloatingActionButtonDemo extends StatelessWidget {
  final Widget _floatingActionButton = FloatingActionButton(
    onPressed: () {},
    elevation: 0,
    backgroundColor: Colors.blueGrey,
//    shape: BeveledRectangleBorder(              //变换形状
//      borderRadius: BorderRadius.circular(30)
//    ),
    child: Icon(Icons.add),
  );

  final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
    onPressed: () {},
    label: Text("add"),
    elevation: 0,
    backgroundColor: Colors.blueGrey,
    icon: Icon(Icons.add),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("FloatingActionButtonDemo"),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: _floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), title: Text("test")),
          BottomNavigationBarItem(icon: Icon(Icons.add), title: Text("test")),
          BottomNavigationBarItem(icon: Icon(Icons.add), title: Text("test")),
        ],
      ),
    );
  }
}
