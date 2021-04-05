import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('FlutterDemo')),
          body: LayoutDemo(),
        ));
  }
}
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Wrap(
      // 主轴的方向，默认水平
      direction: Axis.horizontal,
      // 主轴的对其方式
      alignment: WrapAlignment.start,
      // 主轴方向上的间距
      spacing:10,
      // run 的对齐方式。run 可以理解为新的行或者 列，如果是水平方向布局的话，run 可以理解 为新的一行
      runAlignment: WrapAlignment.center,
      // run 的间距
      runSpacing: 10,
      // 定义了 children 摆放顺序，默认是 down，见 Flex 相关属性介绍
      verticalDirection: VerticalDirection.up,
      children: <Widget>[
        MyButton("第1集"),
        MyButton("第2集"),
        MyButton("第3集"),
        MyButton("第4集"),
        MyButton("第5集"),
        MyButton("第6集"),
        MyButton("第7集"),
        MyButton("第8集"),
        MyButton("第9集"),
        MyButton("第10集"),
        MyButton("第11集"),
        MyButton("第12集"),
        MyButton("第13集"),
        MyButton("第14集"),
        MyButton("第15集"),
        MyButton("第16集"),
        MyButton("第17集"),
        MyButton("第18集"),
        MyButton("第19集"),
        MyButton("第20集"),
      ],
    );
  }
}

class MyButton extends StatelessWidget{
  final String text;
  const MyButton(this.text,{Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
        child: Text(this.text),
        textColor:Theme.of(context).accentColor,
        onPressed: (){
        }
    );
  }
}