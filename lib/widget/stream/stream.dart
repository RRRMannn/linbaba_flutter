import 'package:flutter/material.dart';
import 'dart:async';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("StreamDemo"),
        elevation: 0,
      ),
      body: StreamDemoHome(),
    );
  }
}
/*  StatefulWidget响应式编程  */
//class StreamDemoHome extends StatefulWidget {
//  @override
//  _StreamDemoHomeState createState() => _StreamDemoHomeState();
//}

//class _StreamDemoHomeState extends State<StreamDemoHome> {
//  /*  stream订阅控制  */
//  StreamSubscription _streamDemoSubscription;
//
//  /*  通过StreamController创建stream  */
//  StreamController<String> _streamDemo;
//
//  StreamSink _sinkDemo;
//
//  String _data;
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//
////            Text(_data),                //需要手动设置setState()
//
//            StreamBuilder(                //stream数据流出后自动调用setState()
//              stream: _streamDemo.stream,
//              initialData: "...",         //初始显示数据
//              builder: (context,snapshot){
//                return Text("${snapshot.data}");
//              },
//            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                FlatButton(
//                  child: Text("Add"),
//                  onPressed: addDataToStream,
//                ),
//                FlatButton(
//                  child: Text("Pause"),
//                  onPressed: _pauserStream,
//                ),
//                FlatButton(
//                  child: Text("Resume"),
//                  onPressed: _resumeStream,
//                ),
//                FlatButton(
//                  child: Text("Cancel"),
//                  onPressed: _cancelStream,
//                ),
//              ],
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//
//  @override
//  void initState() {
//    super.initState();
//
//    print("Creat a stream.");
////    Stream<String> _streamDemo = Stream.fromFuture(fetchData());              //直接往stream中添加数据
//
////    _streamDemo = new StreamController();               //只允许单条订阅
//    _streamDemo = new StreamController.broadcast(); //允许多条订阅
//
//    _sinkDemo = _streamDemo.sink;
//
//    print("Start listening on a stream.");
//    _streamDemoSubscription =
//        _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);
//    _streamDemo.stream.listen(onDataTwo, onError: onError, onDone: onDone);
//
//    print("Initialize completed.");
//  }
//
//  Future<String> fetchData() async {
//    await Future.delayed(Duration(seconds: 5)); //设置等待时间
//
////    throw "Something was wrong!";
//
//    return "hello~";
//  }
//
//  void onData(String Data) {
////    setState(() {
////      _data=Data;
////    });
//    _data=Data;
//    print("$Data");
//  }
//
//  void onDataTwo(String Data) {
//    print("onDataTwo:$Data");
//  }
//
//  void onError(error) {
//    print("Error:$error");
//  }
//
//  void onDone() {
//    print("Done!");
//  }
//
//  void _pauserStream() {
//    //暂停监听
//    print("Pause subscription!");
//    _streamDemoSubscription.pause();
//  }
//
//  void _resumeStream() {
//    //恢复监听
//    print("Resume subscription!");
//    _streamDemoSubscription.resume();
//  }
//
//  void _cancelStream() {
//    //取消监听
//    print("Cancel subscription!");
//    _streamDemoSubscription.cancel();
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//    _streamDemo.close();
//  }
//
//  void addDataToStream() async {
//    print("Add data to stream.");
//
//    String data = await fetchData();
//
////    _streamDemo.add(data);  //通过StreamController向stream中添加数据
//    _sinkDemo.add(data); //通过StreamSink向stream中添加数据
//  }
//}

/*  StatelessWidget响应式编程  */
class StreamDemoHome extends StatelessWidget {
  /*  stream订阅控制  */
  StreamSubscription _streamDemoSubscription;

  /*  通过StreamController创建stream  */
  StreamController<String> _streamDemo;

  StreamSink _sinkDemo;

  String _data;

  @override
  Widget build(BuildContext context) {
    print("Creat a stream.");
//    Stream<String> _streamDemo = Stream.fromFuture(fetchData());              //直接往stream中添加数据

//    _streamDemo = new StreamController();               //只允许单条订阅
    _streamDemo = new StreamController.broadcast(); //允许多条订阅

    _sinkDemo = _streamDemo.sink;

    print("Start listening on a stream.");
    _streamDemoSubscription =
        _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);
    _streamDemo.stream.listen(onDataTwo, onError: onError, onDone: onDone);

    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

//            Text(_data),                //需要手动设置setState()

            StreamBuilder(                //stream数据流出后自动调用setState()
              stream: _streamDemo.stream,
              initialData: "...",         //初始显示数据
              builder: (context,snapshot){
                return Text("${snapshot.data}");
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text("Add"),
                  onPressed: addDataToStream,
                ),
                FlatButton(
                  child: Text("Pause"),
                  onPressed: _pauserStream,
                ),
                FlatButton(
                  child: Text("Resume"),
                  onPressed: _resumeStream,
                ),
                FlatButton(
                  child: Text("Cancel"),
                  onPressed: _cancelStream,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5)); //设置等待时间

//    throw "Something was wrong!";

    return "hello~";
  }

  void onData(String Data) {
//    setState(() {
//      _data=Data;
//    });
    _data=Data;
    print("$Data");
  }

  void onDataTwo(String Data) {
    print("onDataTwo:$Data");
  }

  void onError(error) {
    print("Error:$error");
  }

  void onDone() {
    print("Done!");
  }

  void _pauserStream() {
    //暂停监听
    print("Pause subscription!");
    _streamDemoSubscription.pause();
  }

  void _resumeStream() {
    //恢复监听
    print("Resume subscription!");
    _streamDemoSubscription.resume();
  }

  void _cancelStream() {
    //取消监听
    print("Cancel subscription!");
    _streamDemoSubscription.cancel();
  }

  void addDataToStream() async {
    print("Add data to stream.");

    String data = await fetchData();

//    _streamDemo.add(data);  //通过StreamController向stream中添加数据
    _sinkDemo.add(data); //通过StreamSink向stream中添加数据
  }
}
