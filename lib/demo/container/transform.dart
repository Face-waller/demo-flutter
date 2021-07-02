import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyTransform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('变换'),),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                  color: Colors.black,
                  child: new Transform(
                    alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
                    transform: new Matrix4.skewY(0.1), //沿Y轴倾斜0.3弧度
                    child: new Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.deepOrange,
                      child: const Text('Apartment for rent!'),
                    ),
                  ),
                ),
              ),
              Padding( // 平移
                padding: EdgeInsets.all(16),
                child: Container(
                  color: Colors.black,
                  child: DecoratedBox(
                    decoration:BoxDecoration(color: Colors.red),
                    //默认原点为左上角，左移20像素，向上平移5像素
                    child: Transform.translate(
                      offset: Offset(-20.0, -5.0),
                      child: Text("Hello world"),
                    ),
                  )
                ),
              ),
              Padding( // 旋转
                padding: EdgeInsets.all(16),
                child: DecoratedBox(
                  decoration:BoxDecoration(color: Colors.red),
                  child: Transform.rotate(
                    //旋转90度
                    angle: math.pi/2 ,
                    child: Text("Hello world"),
                  ),
                ),
              ),
              Padding( // 缩放
                padding: EdgeInsets.all(16),
                child: DecoratedBox(
                    decoration:BoxDecoration(color: Colors.red),
                    child: Transform.scale(
                        scale: 1.5, //放大到1.5倍
                        child: Text("Hello world")
                    )
                )
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    DecoratedBox(
                        decoration:BoxDecoration(color: Colors.red),
                        child: Transform.scale(scale: 1.5,
                            child: Text("Hello world")
                        )
                    ),
                    Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
                  ],
                )
              ),
              /// RotatedBox
              /// RotatedBox和Transform.rotate功能相似，它们都可以对子组件进行旋转变换,
              /// 但是有一点不同：RotatedBox的变换是在layout阶段，会影响在子组件的位置和大小
              Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      DecoratedBox(
                        decoration: BoxDecoration(color: Colors.red),
                        //将Transform.rotate换成RotatedBox
                        child: RotatedBox(
                          quarterTurns: 1, //旋转90度(1/4圈)
                          child: Text("Hello world"),
                        ),
                      ),
                      Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
                    ],
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}