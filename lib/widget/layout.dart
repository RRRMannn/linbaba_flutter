import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(

//        mainAxisAlignment: MainAxisAlignment.center,        //主轴居中
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,       //剩余空间分配到部件之间
//        mainAxisAlignment: MainAxisAlignment.spaceAround,       //剩余空间围绕部件周围
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,       //平均分配剩余空间

        crossAxisAlignment: CrossAxisAlignment.center,        //交叉轴中部对齐
//        crossAxisAlignment: CrossAxisAlignment.stretch,        //交叉轴方向拉伸


        children: <Widget>[
          IconBadge(Icons.pool),
          IconBadge(Icons.beach_access,size: 64,),
          IconBadge(Icons.airplanemode_active)
        ],
      ),
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;

  IconBadge(this.icon, {this.size = 32});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: this.size + 60,
      height: this.size + 60,
      color: Colors.lightGreenAccent,
      child: Icon(
        this.icon,
        size: this.size,
        color: Colors.yellow,
      ),
    );
  }
}
