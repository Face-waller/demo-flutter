import 'package:flutter/material.dart';

class MyPackAnimatedWidget extends StatefulWidget {
  @override
  _MyPackAnimatedWidget createState() => _MyPackAnimatedWidget();

}

class _MyPackAnimatedWidget extends State<MyPackAnimatedWidget> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation _animation3;

  @override
  void initState() {
    _animationController = AnimationController(duration: Duration(seconds: 5), vsync: this);
    _animation3 = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: 50.0, end: 100.0).chain(CurveTween(curve: Curves.easeIn)),
          weight: 40
      ),
      TweenSequenceItem(
          tween: ConstantTween<double>(100.0),
          weight: 20
      ),
      TweenSequenceItem(
          tween: Tween(begin: 100.0, end: 150.0),
          weight: 40
      ),
    ]).animate(_animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('使用封装的动画组件'),),
      body: MyAnimatedWidget(
        setS: setState,
        controller: _animationController,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Container(
                  height: _animation3.value,
                  width: _animation3.value,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}

/// 封装的组件
class MyAnimatedWidget extends StatefulWidget {
  final AnimationController controller;
  final Widget child;
  final Function setS;

  const MyAnimatedWidget({Key? key, required this.controller, required this.child, required this.setS}) : super(key: key);

  @override
  _MyAnimatedWidgetState createState() => _MyAnimatedWidgetState();

}

class _MyAnimatedWidgetState extends State<MyAnimatedWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void initState() {
    widget.controller.addListener((){
      widget.setS((){
      });
    });
    super.initState();
    widget.controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
  }

}