import 'package:flutter/material.dart';
import '../model/post.dart';

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
//            pinned: true,         //固定在顶部
            floating: true,       //向上划不用到顶都可显示appbar
//            centerTitle: true,
//            title: Text(
//                "林爸爸",
//            ),
          expandedHeight: 178,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "Lin Ba Ba",
                style: TextStyle(
                  letterSpacing: 3,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              background: Image.network(
                "http://b-ssl.duitang.com/uploads/item/201612/12/20161212114327_iQ4aR.thumb.700_0.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(8),
              sliver: SliverListDemo(),
            ),
          )
        ],
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 32),
          child: Material(
            borderRadius: BorderRadius.circular(12.0),
            elevation: 14.0,
            shadowColor: Colors.grey.withOpacity(0.5),
            child: Stack(
              children: <Widget>[
                Container(
                  child: Container(
                    child: Image.network(posts[index].imageUrl),
                  ),
                ),
                Positioned(
                    bottom: 32,
                    left: 32,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          posts[index].title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                        Text(
                          posts[index].author,
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        )
                      ],
                    ))
              ],
            ),
          ),
        );
      }, childCount: posts.length //网格内项目数量
          ),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1.0 //网格项目比例
          ),
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          child: Image.network(posts[index].imageUrl),
        );
      }, childCount: posts.length //网格内项目数量
          ),
    );
  }
}
