import 'dart:math';

import 'package:demo_flutter/demo/route/route.dart';
import 'package:flutter/material.dart';

class MyPeacock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('孔雀开屏动画'),),
      body: Container(
        decoration: new BoxDecoration(color: Colors.blue),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(CirclePageRoute(
                builder: (context) {
                  return APage();
                },
                barrierLabel: 'hello',
                barrierColor: Colors.white
            ));
          },
          child: Text('跳转到页面A'),
        ),
      )
    );
  }

}

// 封装的孔雀开屏组件
class CirclePageRoute extends PageRoute {
  CirclePageRoute({
    required this.builder,
    this.transitionDuration = const Duration(milliseconds: 500),
    this.opaque = true,
    this.barrierDismissible = false,
    required this.barrierColor,
    required this.barrierLabel,
    this.maintainState = true,
  });

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return ClipPath(
          clipper: CirclePath(animation.value),
          child: child,
        );
      },
      child: builder(context),
    );
  }
}

class CirclePath extends CustomClipper<Path> {
  CirclePath(this.value);

  final double value;

  @override
  Path getClip(Size size) {
    var path = Path();
    double radius =
        value * sqrt(size.height * size.height + size.width * size.width);
    path.addOval(Rect.fromLTRB(
        size.width - radius, -radius, size.width + radius, radius));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}