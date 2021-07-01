/*Wrap 可以实现流布局，单行的 Wrap 跟 Row 表现几乎一致，单列的 Wrap 则跟 Row 表 现几乎一致。
但 Row 与 Column 都是单行单列的，Wrap 则突破了这个限制，mainAxis 上空 间不足时，则向 crossAxis 上去扩展显示。*/

import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FlutterDemo')),
      body: Wrap(
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
          _MyButton("第1集"),
          _MyButton("第2集"),
          _MyButton("第3集"),
          _MyButton("第4集"),
          _MyButton("第5集"),
          _MyButton("第6集"),
          _MyButton("第7集"),
          _MyButton("第8集"),
          _MyButton("第9集"),
          _MyButton("第10集"),
          _MyButton("第11集"),
          _MyButton("第12集"),
          _MyButton("第13集"),
          _MyButton("第14集"),
          _MyButton("第15集"),
          _MyButton("第16集"),
          _MyButton("第17集"),
          _MyButton("第18集"),
          _MyButton("第19集"),
          _MyButton("第20集"),
        ],
      )
    );
  }
}

class _MyButton extends StatelessWidget{
  final String text;
  const _MyButton(this.text,{Key? key}) : super(key: key);
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