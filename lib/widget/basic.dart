import 'package:flutter/material.dart';

class Basic extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("http://b-ssl.duitang.com/uploads/item/201612/12/20161212114327_iQ4aR.thumb.700_0.jpeg"),
          alignment: Alignment.topCenter,
          fit: BoxFit.cover
        ),

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon(Icons.pool,size: 32,color: Colors.black,),
            padding: EdgeInsets.all(16),    //内边距
            margin: EdgeInsets.all(8),      //外边距
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.yellow,
//              borderRadius: BorderRadius.circular(180),       //圆角效果
              shape: BoxShape.circle,                         //box形状
              boxShadow: [                                    //阴影效果
                BoxShadow(
                  offset: Offset(0, 10),           //阴影偏移
                  color: Colors.grey,             //阴影颜色
                  blurRadius: 10,                 //阴影模糊度
                  spreadRadius: 1,                //阴影面积
                )
              ],
              border: Border.all(
                color: Colors.yellowAccent,
                width: 3,
                style: BorderStyle.solid,
              ),
            ),
          )
        ],
      ),
    );
  }

}

class RichTextBasic extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(
        text: TextSpan(
            text: "《哈哈哈》",
            style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontSize: 34,
              fontStyle: FontStyle.italic,
              fontWeight:FontWeight.bold,
            ),
            children: <TextSpan>[
              TextSpan(
                text: "林爸爸",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 27,
                  fontStyle: FontStyle.normal,
                  fontWeight:FontWeight.bold,
                ),
              ),
              TextSpan(
                text: "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                ),
              )
            ]
        )

    );
  }

}

class TextBasic extends StatelessWidget{

  final TextStyle _textStyle = TextStyle(
    fontSize: 16,
  );

  final String _author="林爸爸";
  final String _title="哈哈哈";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      "《$_title》——$_author，哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈",
      textAlign: TextAlign.left,
      style: _textStyle,
      softWrap: true,
      maxLines: 4,                                //设置最大显示行数
      overflow: TextOverflow.ellipsis,            //多余的用省略号表示

    );
  }

}