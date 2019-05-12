import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("RxDartDemo"),
        elevation: 0,
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  PublishSubject<String> _textFieldSubject;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: Colors.black),
      child: TextField(
        onChanged: (value) {
          _textFieldSubject.add("input:$value");
        },
        onSubmitted: (value) {
          _textFieldSubject.add("submit: $value");
        },
        decoration: InputDecoration(labelText: 'Title', filled: true),
      ),
    );
  }

  @override
  void initState() {
    _textFieldSubject = PublishSubject<String>();

    _textFieldSubject
//        .map((item)=>"item: $item")                                   /*  监听过滤  */
//        .where((item) => item.length > 9)
        .debounceTime(Duration(milliseconds: 500))
        .listen((data) => debugPrint(data));

    /**
     * 尝试各种输出方式
     */
      /*  变量数组输出  */
//    Observable<String> _observable=Observable(Stream.fromIterable());
//    Observable<String> _observable=Observable.fromIterable(['hello','林爸爸']);
//    Observable<String> _observable=Observable.just("嗨佬!");

      /*  延迟输出  */
//    Observable<String> _observable=Observable(Stream.fromFuture(Future.value("hello!")));
//    Observable<String> _observable=Observable.fromFuture(Future.value("hello!"));

      /*  循环输出  */
//      Observable<String> _observable =
//          Observable.periodic(Duration(seconds: 3), (x) => x.toString());
//
//      _observable.listen(print);

    /**
     * 尝试PublishSubject操作
     */
//      PublishSubject<String> _subject=PublishSubject<String>();
//      _subject.add("hello!!!");
//      _subject.listen((data)=>debugPrint("listen 1: $data"));
//      _subject.add("hey!!!");
//      _subject.listen((data)=>debugPrint("listen 2: ${data.toUpperCase()}"));
//      _subject.add("hi!!!");
//
//      _subject.close();

    /**
     * 尝试BehaviorSubject操作
     */
//      BehaviorSubject<String> _subject=BehaviorSubject<String>();
//      _subject.listen((data)=>debugPrint("listen 1: $data"));
//      _subject.add("hello!!!");
//      _subject.add("hey!!!");
//      _subject.listen((data)=>debugPrint("listen 2: ${data.toUpperCase()}"));
//      _subject.add("hi!!!");
//
//      _subject.close();

    /**
     * 尝试ReplaySubject操作
     */
//      ReplaySubject<String> _subject=ReplaySubject<String>();
//      ReplaySubject<String> _subject=ReplaySubject<String>(maxSize: 2);
//      _subject.add("hello!!!");
//      _subject.add("hey!!!");
//      _subject.add("hi!!!");
//      _subject.listen((data)=>debugPrint("listen 1: $data"));
//      _subject.listen((data)=>debugPrint("listen 2: ${data.toUpperCase()}"));
//
//      _subject.close();
  }

  @override
  void dispose() {
    _textFieldSubject.close();
  }
}
