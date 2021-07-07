import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyGestureDetector extends StatefulWidget {
  @override
  GestureDetectorState createState() {
    return GestureDetectorState();
  }

}

class GestureDetectorState extends State<MyGestureDetector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('手势'),),
      body: Column(
        children: [
          GestureDetector(

            // onTapDown：按下时回调。
            // onTapUp：抬起时回调。
            // onTap：点击事件回调。
            // onTapCancel：点击取消事件回调。
            onTapDown: (TapDownDetails tapDownDetails) {print('onTapDown');},
            onTapUp: (TapUpDetails tapUpDetails) {print('onTapUp');},
            onTap: () {print('onTap');},
            onTapCancel: () {print('onTapCancel');},

            // 双击事件
            onDoubleTap: ()=>print('onDoubleTap'),

            // onLongPressStart：长按开始事件回调。
            // onLongPressMoveUpdate：长按移动事件回调。
            // onLongPressUp：长按抬起事件回调。
            // onLongPressEnd：长按结束事件回调。
            // onLongPress：长按事件回调。
            onLongPressStart: (v) => print('onLongPressStart'),
            onLongPressMoveUpdate: (v) => print('onLongPressMoveUpdate'),
            onLongPressUp: () => print('onLongPressUp'),
            onLongPressEnd: (v) => print('onLongPressEnd'),
            onLongPress: () => print('onLongPress'),

            // onVerticalDragDown：垂直拖动按下事件回调
            // onVerticalDragStart：垂直拖动开始事件回调
            // onVerticalDragUpdate：指针移动更新事件回调
            // onVerticalDragEnd：垂直拖动结束事件回调
            // onVerticalDragCancel：垂直拖动取消事件回调
            onVerticalDragStart: (v) => print('onVerticalDragStart'),
            onVerticalDragDown: (v) => print('onVerticalDragDown'),
            onVerticalDragUpdate: (v) => print('onVerticalDragUpdate'),
            onVerticalDragCancel: () => print('onVerticalDragCancel'),
            onVerticalDragEnd: (v) => print('onVerticalDragEnd'),

            // onScaleStart：缩放开始事件回调。
            // onScaleUpdate：缩放更新事件回调。
            // onScaleEnd：缩放结束事件回调。
            onScaleStart: (v) => print('onScaleStart'),
            onScaleUpdate: (ScaleUpdateDetails v) => print('onScaleUpdate'),
            onScaleEnd: (v) => print('onScaleEnd'),
            child: Center(
              child: Container(
                width: 200,
                height: 200,
                color: Colors.red,
              ),
            ),
          )

        ],
      ),
    );
  }

}