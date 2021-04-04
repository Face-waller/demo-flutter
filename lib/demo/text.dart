import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: '我是一个标题',
        home: Scaffold(
          appBar: AppBar(
            title: Text('你好'),
            elevation: 30.0, // 设置标题阴影 不需要的话设置成0.0
          ),
          body: MyHome(),
        ),
        theme: ThemeData(//设置主题颜色
            primarySwatch: Colors.yellow
        )
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text(
        "我是Dart一个文本内容我是Dart一个文本内容我是Dart一个文本内容我是Dart一个文本aaaaaaa",
        textDirection: TextDirection.ltr,
        overflow: TextOverflow.ellipsis,
        textScaleFactor: 2,
        maxLines: 1,
        style: TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
          color: Colors.black38
        ),
      ),
    );
  }

}