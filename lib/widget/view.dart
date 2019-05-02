import 'package:flutter/material.dart';
import '../model/post.dart';

class View extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridViewBuilderDemo();
  }
}

class GridViewBuilderDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
      padding: EdgeInsets.all(8),
      itemCount: posts.length,
      itemBuilder: _gridItemBuilder,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,                                  //交叉轴项目数量
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
    );
  }

  Widget _gridItemBuilder(BuildContext context, int index) {
    return Container(
      child: Image.network(
        posts[index].imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}

class GridViewExtentDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.extent(
//      scrollDirection: Axis.horizontal,             //切换成水平滚动
      maxCrossAxisExtent: 200,                        //项目在网格中最大的尺寸
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: _buildViews(100),
    );
  }

  List<Widget> _buildViews(int length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0, 0),
        child: Text(
          "Title$index",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.grey
          ),
        ),
      );
    });
  }
}

class GridViewCountDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(
//      scrollDirection: Axis.horizontal,             //切换成水平滚动
      crossAxisCount: 3,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: _buildViews(100),
    );
  }

  List<Widget> _buildViews(int length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0, 0),
        child: Text(
          "Title$index",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.grey
          ),
        ),
      );
    });
  }
}

class PageItemBuilderDemo extends StatelessWidget {
  int currentPage;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    return MyPageView();
    return PageView.builder(
      onPageChanged: (currentPage) => debugPrint("page:$currentPage"),
      scrollDirection: Axis.vertical,
      itemCount: posts.length,
      itemBuilder: _pageItemBuilder,
    );
  }

  Widget _pageItemBuilder(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          //占满空间的sizebox
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                posts[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                posts[index].author,
              )
            ],
          ),
        )
      ],
    );
  }
}

class MyPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView(
//      pageSnapping: false,          //页面翻动到一半不自动翻页
//      reverse: true,                  //倒置顺序
      onPageChanged: (currentPage) => debugPrint("Page:$currentPage"), //跳转监听
      controller: PageController(
        initialPage: 0, //初始页面（第一页为0）
        keepPage: false, //是否记住翻到哪一页面
        viewportFraction: 0.85, //页面占用比例
      ),
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Container(
          color: Colors.brown[900],
          alignment: Alignment(0, 0),
          child: Text(
            "ONE",
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.grey[900],
          alignment: Alignment(0, 0),
          child: Text(
            "TWO",
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.blueGrey[900],
          alignment: Alignment(0, 0),
          child: Text(
            "THREE",
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
