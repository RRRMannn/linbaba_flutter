import 'package:flutter/material.dart';
import '../../model/post.dart';

class CardDemo extends StatefulWidget {
  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("CardDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
            children: posts.map((post) {
          return Card(
            child: Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0)
                    ),
                    child: Image.network(
                      post.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  )
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(post.imageUrl),
                  ),
                  title: Text(post.title),
                  subtitle: Text(post.author),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    post.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ButtonTheme.bar(
                  child: ButtonBar(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.favorite),
                        color: Colors.grey,
                        onPressed: (){

                        },
                      ),
                      FlatButton(
                        child: Text("Read More"),
                        onPressed: (){},
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }).toList()),
      ),
    );
  }
}
