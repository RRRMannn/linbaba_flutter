import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: 350,
        color: Colors.white,
        padding: EdgeInsets.all(0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("林爸爸",style: TextStyle(fontWeight: FontWeight.bold),),
              accountEmail: Text("aaalin88@163.com",),
              currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage("http://a088.xyz/images/portfolio/0mmexport1554196894459.jpg"),),
              decoration: BoxDecoration(
                color: Colors.yellow[400],
                image: DecorationImage(
                    image: NetworkImage(
                        "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2489492398,1961915359&fm=26&gp=0.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.yellow[400].withOpacity(0.6), BlendMode.colorBurn)
                ),

              ),
            ),
            ListTile(
              title: Text("Message",textAlign: TextAlign.center),
              trailing: Icon(Icons.message,color: Colors.black12,size: 22,),        //标题后面显示图标
//                  leading: Icon(Icons.message,color: Colors.black12,size: 22,),        //标题前面显示图标
              onTap: ()=>Navigator.pop(context),                                      //关闭抽屉
            ),
            ListTile(
              title: Text("Favorite",textAlign: TextAlign.center),
              trailing: Icon(Icons.favorite,color: Colors.black12,size: 22,),        //标题后面显示图标
              onTap: ()=>Navigator.pop(context),
            ),
            ListTile(
              title: Text("Setting",textAlign: TextAlign.center),
              trailing: Icon(Icons.settings,color: Colors.black12,size: 22,),        //标题后面显示图标
              onTap: ()=>Navigator.pop(context),
            ),
          ],
        )

    );
  }
}