import 'package:flutter/material.dart';
import 'model/post.dart';
import 'widget/mydrawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        highlightColor: Colors.white10,
        splashColor:  Colors.white70,
      ),
      home: Home()
    );
  }
}

class Home extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            centerTitle: true,
            title: Text("林爸爸"),
            elevation: 10,                    //阴影大小
//            leading: IconButton(
//              icon: Icon(Icons.menu),
//              tooltip: "抽屉",
//              onPressed: ()=>debugPrint("测试抽屉！"),
//            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                tooltip: "搜索",
                onPressed: ()=>debugPrint("测试搜索！"),
              ),
            ],
            bottom: TabBar(
              unselectedLabelColor: Colors.black38,         //未选择颜色
              indicatorColor: Colors.black54,               //下方提示线
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 2.0,
              tabs: <Widget>[
                Tab(icon: Icon(Icons.local_florist),),
                Tab(icon: Icon(Icons.change_history),),
                Tab(icon: Icon(Icons.directions_bike),),
              ]
            ),
          ),
          body: TabBarView(
              children: <Widget>[
                ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: _listItemBuilder,
                ),
//                Icon(Icons.local_florist,size: 120,color: Colors.yellow,),
                Icon(Icons.change_history,size: 120,color: Colors.yellow,),
                Icon(Icons.directions_bike,size: 120,color: Colors.yellow,),
              ]
          ),
          drawer: MyDrawer()

      ),
    );
  }

  Widget _listItemBuilder(BuildContext context,int index){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Image.network(posts[index].imageUrl),
          SizedBox(
            height: 16,
          ),
          Text(
            posts[index].title,
            style: Theme.of(context).textTheme.title,
          ),
          Text(
            posts[index].author,
            style: Theme.of(context).textTheme.subhead,
          ),
          SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}

