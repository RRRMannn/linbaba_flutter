import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //扁平化按钮
    final Widget _flatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          //扁平化按钮
          onPressed: () {},
          child: Text("Btton"),
          color: Colors.blueGrey,
          splashColor: Colors.grey,
          //水波颜色
          textColor: Theme.of(context).accentColor, //文字颜色
        ),
        SizedBox(
          width: 16,
        ),
        FlatButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text("add"),
          color: Colors.blueGrey,
          splashColor: Colors.grey,
          //水波颜色
          textColor: Theme.of(context).accentColor, //文字颜色
        ),
      ],
    );

    //立体化按钮
    final Widget _raisedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          //立体化按钮
          elevation: 8,
          onPressed: () {},
          child: Text("Btton"),
          splashColor: Colors.grey,
          //水波颜色
          textColor: Colors.white,
          //文字颜色
          color: Theme.of(context).accentColor,
        ),
        SizedBox(
          width: 16,
        ),
        RaisedButton.icon(
          elevation: 8,
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text("add"),
          splashColor: Colors.grey,
          //水波颜色
          textColor: Colors.white,
          //文字颜色
          color: Theme.of(context).accentColor,
        ),
      ],
    );

    //带边框按钮
    final Widget _outlineButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        OutlineButton(
          //边框按钮
          onPressed: () {},
          child: Text("Btton"),
          splashColor: Colors.grey,
          highlightedBorderColor: Colors.grey,
          textColor: Colors.black,
          //文字颜色
          borderSide: BorderSide(color: Colors.black),
        ),
        SizedBox(
          width: 16,
        ),
        OutlineButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text("add"),
          splashColor: Colors.grey,
          highlightedBorderColor: Colors.grey,
          //水波颜色
          textColor: Colors.black,
          //文字颜色
          borderSide: BorderSide(color: Colors.black),
        ),
      ],
    );

    //Container容器控制按钮宽度
    final Widget _fixedWidthButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 200,
          child: OutlineButton(
            //边框按钮
            onPressed: () {},
            child: Text("Btton"),
            splashColor: Colors.grey,
            highlightedBorderColor: Colors.grey,
            textColor: Colors.black,
            //文字颜色
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        SizedBox(
          width: 16,
        ),
        OutlineButton(
          //边框按钮
          onPressed: () {},
          child: Text("Btton"),
          splashColor: Colors.grey,
          highlightedBorderColor: Colors.grey,
          textColor: Colors.black,
          //文字颜色
          borderSide: BorderSide(color: Colors.black),
        ),
      ],
    );

    //Expanded容器自动调节按钮宽度
    final Widget _expandedButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 1, //调整占位比例
          child: OutlineButton(
            //边框按钮
            onPressed: () {},
            child: Text("Btton"),
            splashColor: Colors.grey,
            highlightedBorderColor: Colors.grey,
            textColor: Colors.black,
            //文字颜色
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          flex: 2,
          child: OutlineButton(
            //边框按钮
            onPressed: () {},
            child: Text("Btton"),
            splashColor: Colors.grey,
            highlightedBorderColor: Colors.grey,
            textColor: Colors.black,
            //文字颜色
            borderSide: BorderSide(color: Colors.black),
          ),
        )
      ],
    );

    //ButtonBar容器
    final Widget _buttonBarDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
              buttonTheme: ButtonThemeData(
                  padding: EdgeInsets.symmetric(horizontal: 8))),
          child: ButtonBar(
            children: <Widget>[
              OutlineButton(
                //边框按钮
                onPressed: () {},
                child: Text("Btton"),
                splashColor: Colors.grey,
                highlightedBorderColor: Colors.grey,
                textColor: Colors.black,
                //文字颜色
                borderSide: BorderSide(color: Colors.black),
              ),
              SizedBox(
                width: 16,
              ),
              OutlineButton(
                //边框按钮
                onPressed: () {},
                child: Text("Btton"),
                splashColor: Colors.grey,
                highlightedBorderColor: Colors.grey,
                textColor: Colors.black,
                //文字颜色
                borderSide: BorderSide(color: Colors.black),
              ),
            ],
          ),
        )
      ],
    );

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ButtonDemo"),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _flatButtonDemo,
            _raisedButtonDemo,
            _outlineButtonDemo,
            _fixedWidthButton,
            _expandedButton,
            _buttonBarDemo
          ],
        ),
      ),
    );
  }
}
