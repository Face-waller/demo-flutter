import 'package:flutter/material.dart';

class MyAnimationController extends StatefulWidget {
  @override
  _AnimationState createState() => _AnimationState();
}

class _AnimationState extends State<MyAnimationController> with SingleTickerProviderStateMixin {
  double _size = 100;

  Color _startColor = Colors.blue;
  Color _endColor = Colors.red;
  Color _color = Colors.blue;

  late AnimationController _controller;

  late Animation<Color> _animation;


  //  动画的状态分为四种：
  //
  //  dismissed：动画停止在开始处。
  //  forward：动画正在从开始处运行到结束处（正向运行）。
  //  reverse：动画正在从结束处运行到开始处（反向运行）。
  //  completed：动画停止在结束处。
  //  再来看下动画的控制方法：
  //
  //  forward：正向执行动画。
  //  reverse：反向执行动画。
  //  repeat：反复执行动画。
  //  reset：重置动画。
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500),
        lowerBound: 0,upperBound: 1
    )..addListener((){
      setState(() {
        // _controller.value 当前动画的值，默认从 0 到 1, 可以通过参数形式设置最大值和最小值
        _size = 100 + 100 * _controller.value;
        // Flutter 中把这种从 0 -> 1 转换为 蓝色 -> 红色 行为称之为 Tween（映射）
        _color = Color.lerp(_startColor, _endColor, _controller.value)!;
      });
    })..addStatusListener((status){
      if(status == AnimationStatus.completed){
        _controller.reverse();
      }else if(status == AnimationStatus.dismissed){
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('动画'),),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _controller.forward();
            });
          },
          child: Container(
            height: _size,
            width: _size,
            color: _color,
            alignment: Alignment.center,
            child: Text('点我变大',style: TextStyle(color: Colors.white,fontSize: 18),),
          ),
        ),
      ),
    );
  }

}