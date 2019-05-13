import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("HttpDemo"),
        elevation: 0,
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchPosts(),
      builder: (context, snapshot) {
        print("data:${snapshot.data}");
        print("connectionState:${snapshot.connectionState}");

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text("Loading..."),
          );
        }
        return ListView(
          children: snapshot.data
              .map<Widget>((item) => ListTile(
                    title: Text(item.projectName),
                    subtitle: Text(item.type),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage("http://120.78.148.54/images/portfolio/${item.imgPath}"),
                    ),
                  ))
              .toList(),
        );
      },
    );
  }

  @override
  void initState() {
//    fetchPosts().then((value)=>print(value));

//    /*  创建Map类型数据  */
//    final post = {'title': "hello", "description": "nice to meet you"};
//
//    print(post['title']);
//    print(post['description']);
//
//    /*  Map类型转换成Json  */
//    final postJson = json.encode(post);
//    print("Json: $postJson");
//
//    /*  Json类型转换成Map  */
//    final postJsonConverted = json.decode(postJson);
//    print("Map?${postJsonConverted is Map}");
//    print("title: ${postJsonConverted['title']}");
//    print("description: ${postJsonConverted['description']}");
//
//    final postModel = Post.fromeJson(postJsonConverted);
//    print("title: ${postModel.title},description: ${postModel.description}");
//
//    /*  json.encode(object) 如果object不是一个基本类型则会将object.toJosn转换成Json数据并返回 */
//    print("${json.encode(postModel)}");
  }

  Future<List<Post>> fetchPosts() async {
    final response =
        await http.get("http://120.78.148.54/servlet/androidGetInfoServlet?type=portfolio");

//    print(response.statusCode);
//    print(response.body);
    if (response.statusCode == 200) {
      final responsebody = json.decode(response.body);
      List<Post> posts = responsebody
          .map<Post>((item) => Post.fromeJson(item))
          .toList();
      return posts;
    } else {
      throw Exception("Fail to fetch posts.");
    }
  }
}

class Post {
  final int portfolioNo;
  final String projectName;
  final String type;
  final String imgPath;
  final String context;

  Post(this.portfolioNo, this.projectName, this.type, this.imgPath, this.context);

  Post.fromeJson(Map json)
      : portfolioNo = json['portfolioNo'],
        projectName = json['projectName'],
        type = json['type'],
        imgPath = json['imgPath'],
        context = json['context'];

//  Map toJson() => {"title": title, "description": description};
}
