/// Curve 是 AnimationController 动画执行曲线

import 'package:flutter/material.dart';

class MyCurve extends StatefulWidget {
  @override
  _MyCurveState createState() => _MyCurveState();
}

class _MyCurveState extends State<MyCurve> with  SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: Duration(milliseconds: 1000))..addListener(() {
      setState(() {});
    });

    _animation = Tween(begin: 100.0, end: 200.0)
        .chain(CurveTween(curve: /*Curves.decelerate*/ _StairsCurve(5)))
        .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Curve'),),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _controller.forward();
          },
          child: Container(
            height: _animation.value,
            width: _animation.value,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              '点我变大',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}

/// 自定义曲线
class _StairsCurve extends Curve {
  //阶梯的数量
  final int num;
  double _perStairY = 0;
  double _perStairX = 0;

  _StairsCurve(this.num) {
    _perStairY = 1.0 / (num - 1);
    _perStairX = 1.0 / num;
  }

  @override
  double transformInternal(double t) {
    return _perStairY * (t / _perStairX).floor();
  }
}