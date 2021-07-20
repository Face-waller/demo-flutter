/// 显示动画组件：
/// 需要设置 AnimationController，控制动画的执行，使用显式动画可以完成任何隐式动画的效果，
/// 甚至功能更丰富一些，不过你需要管理该动画的 AnimationController 生命周期，
/// AnimationController 并不是一个控件，所以需要将其放在 stateful 控件中。
/// 显示动画组件有：AlignTransition、AnimatedBuilder、AnimatedModalBarrier、
/// DecoratedBoxTransition、DefaultTextStyleTransition、PositionedTransition、
/// RelativePositionedTransition、RotationTransition、ScaleTransition、SizeTransition、
/// SlideTransition 、FadeTransition 等。

import 'package:flutter/material.dart';

class MyAnimatedExplicit extends StatefulWidget {
  @override
  _MyAnimatedExplicitState createState() => _MyAnimatedExplicitState();
}

class _MyAnimatedExplicitState extends State<MyAnimatedExplicit> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<Size?> _sizeAnimation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));

    _colorAnimation = ColorTween(begin: Colors.blue, end: Colors.red).animate(_controller);
    _sizeAnimation = SizeTween(begin: Size(100.0, 50.0), end: Size(200.0, 100.0)).animate(_controller);

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('显式动画组件'),),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, widget) {
            return Container(
              width: _sizeAnimation.value!.width,
              height: _sizeAnimation.value!.height,
              color: _colorAnimation.value,
            );
          },
        ),
      ),
    );
  }

}