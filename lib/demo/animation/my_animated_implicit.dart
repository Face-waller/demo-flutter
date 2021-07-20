/// 隐式动画组件：
/// 只需提供给组件动画开始、结束值，组件创建 AnimationController、Curve、Tween，
/// 执行动画，释放AnimationController，
/// 我们称之为隐式动画组件，隐式动画组件有：
/// AnimatedAlign、AnimatedContainer、AnimatedDefaultTextStyle、
/// AnimatedOpacity、AnimatedPadding、AnimatedPhysicalModel、AnimatedPositioned、
/// AnimatedPositionedDirectional、AnimatedTheme、SliverAnimatedOpacity、TweenAnimationBuilder、
/// AnimatedContainer 等。
///
///
/// Flutter 内置的动画组件分为两种：隐式动画组件 和 显示动画组件 ，
/// 显示动画组件只封装了 setState 方法，需要开发者创建 AnimationController，
/// 并管理 AnimationController。隐式动画组件封装了 AnimationController、Curve、Tween，
/// 只需提供给组件动画开始、结束值，其余由系统管理。

import 'package:flutter/material.dart';

class MyAnimatedImplicit extends StatefulWidget {
  @override
  _MyAnimatedOpacityState createState() => _MyAnimatedOpacityState();

}

class _MyAnimatedOpacityState extends State<MyAnimatedImplicit> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('隐式动画组件'),),
      body: Column(
        children: [
          Center(
            child: AnimatedOpacity(
            opacity: _opacity,
              duration: Duration(seconds: 2),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _opacity = 0;
                  });
                },
                child: Container(
                  height: 60,
                  width: 150,
                  color: Colors.blue,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}