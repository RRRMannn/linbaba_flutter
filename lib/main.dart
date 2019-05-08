import 'package:flutter/material.dart';
import 'model/post.dart';
import 'widget/layout.dart';
import 'widget/mydrawer.dart';
import 'widget/basic.dart';
import 'widget/view.dart';
import 'widget/sliver.dart';
import 'widget/navigator.dart';
import 'widget/post_show.dart';
import 'widget/form.dart';
import 'widget/components.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
//      debugShowCheckedModeBanner: false,              //隐藏debug标志
      routes: {
        "/": (context) => NavigatorDemo(),
        '/Home': (context) => Home(),
        '/Form':(context)=>FormDemo(),
        '/MCs':(context)=>MaterialComponents(),
        '/About': (context) => Page(
              title: "About",
            )
      },
      initialRoute: "/MCs", //初始页面，相当于home
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        highlightColor: Colors.white10,
        splashColor: Colors.white70,
      ),
//      home: NavigatorDemo()
    );
  }
}

class Home extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Homestate();
  }

}

class Homestate extends State<Home>{

  int currentIndex;
  Widget _currentWidget;

  @override
  void initState() {
    currentIndex=0;
    _currentWidget= TabBarView(//TabbarView
        children: <Widget>[
          ListView.builder(
            itemCount: posts.length,
            itemBuilder: _listItemBuilder,
          ),
//              Icon(Icons.local_florist,size: 120,color: Colors.yellow,),
//              Icon(Icons.change_history,size: 120,color: Colors.yellow,),
          Basic(),
//              Icon(Icons.directions_bike,size: 120,color: Colors.yellow,),
          SliverDemo(),
//              Icon(Icons.view_quilt,size: 120,color: Colors.yellow,),
          View(),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      //TabbarController
      length: 4,
      child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            centerTitle: true,
            title: Text("林爸爸"),
            elevation: 10,
            //阴影大小
//            leading: IconButton(
//              icon: Icon(Icons.menu),
//              tooltip: "抽屉",
//              onPressed: ()=>debugPrint("测试抽屉！"),
//            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                tooltip: "搜索",
                onPressed: () => debugPrint("测试搜索！"),
              ),
            ],
            bottom: TabBar(
              //Tabbar
                unselectedLabelColor: Colors.black38,
                //未选择颜色
                indicatorColor: Colors.black54,
                //下方提示线
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 2.0,
                tabs: <Widget>[
                  Tab(
                    icon: Icon(Icons.local_florist),
                  ),
                  Tab(
                    icon: Icon(Icons.change_history),
                  ),
                  Tab(
                    icon: Icon(Icons.directions_bike),
                  ),
                  Tab(
                    icon: Icon(Icons.view_quilt),
                  ),
                ]),
          ),
          body:_currentWidget,
          drawer: MyDrawer(),
          bottomNavigationBar: BottomNavigationBar(
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
          ),
      ),
    );
  }

  void changePage(){
    setState(() {
      debugPrint("$currentIndex");
      if(currentIndex==0){
        _currentWidget=TabBarView(//TabbarView
            children: <Widget>[
              ListView.builder(
                itemCount: posts.length,
                itemBuilder: _listItemBuilder,
              ),
//              Icon(Icons.local_florist,size: 120,color: Colors.yellow,),
//              Icon(Icons.change_history,size: 120,color: Colors.yellow,),
              Basic(),
//              Icon(Icons.directions_bike,size: 120,color: Colors.yellow,),
              SliverDemo(),
//              Icon(Icons.view_quilt,size: 120,color: Colors.yellow,),
              View(),
            ]);
      }else if(currentIndex==1){
        _currentWidget=Basic();
      }else if(currentIndex==2){
        _currentWidget=SliverDemo();
      }else if(currentIndex==3){
        _currentWidget=View();
      }
    });
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
        color: Colors.white,
        margin: EdgeInsets.all(8),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                AspectRatio(
                  child: Image.network(posts[index].imageUrl, fit: BoxFit.fill),
                  aspectRatio: 16 / 12,
                ),
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
            Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.white.withOpacity(0.3),
                    highlightColor: Colors.white.withOpacity(0.1),
                    onTap: () {
//                debugPrint("TAP");
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PostShow(post: posts[index],)));
                    },
                  ),
                ))
          ],
        ));
  }

  void _onTapHandler(int index) {
    setState(() {
      currentIndex=index;
      debugPrint("$currentIndex");
      changePage();
    });
  }
}