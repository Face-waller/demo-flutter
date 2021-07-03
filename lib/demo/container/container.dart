/*
Container({
  this.alignment,
  this.padding, //容器内补白，属于decoration的装饰范围
  Color color, // 背景色
  Decoration decoration, // 背景装饰
  Decoration foregroundDecoration, //前景装饰
  double width,//容器的宽度
  double height, //容器的高度
  BoxConstraints constraints, //容器大小的限制条件
  this.margin,//容器外补白，不属于decoration的装饰范围
  this.transform, //变换
  this.child,
})
*/

import 'package:flutter/material.dart';

class MyCOntainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter demo')
        ),
        body: HomeContent(),
      )
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          '各位同学大家好,各位同学大家好各位同学大家好各位同学大家好各位同学大家好各位同学大家好',
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textScaleFactor: 1.8,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.red,
            fontWeight: FontWeight.w800,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.lineThrough,
            decorationColor: Colors.white,
            decorationStyle: TextDecorationStyle.dashed,
            letterSpacing: 5.0
          ),
        ),
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.yellow,
          border: Border.all(
            color: Colors.blue,
            width: 2.0
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10)
          )
        ),
        padding:EdgeInsets.all(20),
        // padding:EdgeInsets.fromLTRB(10, 30, 5, 0)
        margin: EdgeInsets.fromLTRB(100, 30, 5, 0),
        // transform: Matrix4.translationValues(100, 0, 0),
        // transform: Matrix4.rotationZ(0.3),
        transform: Matrix4.diagonal3Values(1.2, 1, 1),
        alignment: Alignment.center,
      ),
    );
  }
}

