/// Tween 仅仅是映射，动画的控制依然由 AnimationController 控制，因此需要 Tween.animate(_controller) 将控制器传递给Tween
/// Tween 实现了将 AnimationController [0,1]的值映射为其他类型的值，比如颜色、样式等

import 'package:flutter/material.dart';

class MyTween extends StatefulWidget {
  @override
  _MyTweenState createState() => _MyTweenState();
}

class _MyTweenState extends State<MyTween> with SingleTickerProviderStateMixin{
  late AnimationController _controller;

  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    )..addListener((){
    })..addStatusListener((status){
    });
    _animation = ColorTween(begin: Colors.blue, end: Colors.red).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tween'),),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _controller.forward();
            });
          },
          child: Container(
            height: 100,
            width: 100,
            color: _animation.value,
            alignment: Alignment.center,
            child: Text(
              '点我变色',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}