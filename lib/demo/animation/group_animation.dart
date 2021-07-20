import 'package:flutter/material.dart';

class MyGroupAnimation extends StatefulWidget {
  @override
  _MyGroupAnimationState createState() => _MyGroupAnimationState();
  
}

class _MyGroupAnimationState extends State<MyGroupAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  
  late Animation _colorAnimation1;
  late Animation _sizeAnimation1;
  late Animation _animation3;
  
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  
  @override
  void initState() {
    _animationController =
    AnimationController(duration: Duration(seconds: 5), vsync: this)
      ..addListener((){setState(() {
      
      });});
    
    _colorAnimation1 = ColorTween(begin: Colors.red, end: Colors.blue).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.0, 0.5)
    ));
    
    _sizeAnimation1 = Tween(begin: 100.0, end: 200.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.5, 1.0)
    ));
    
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
    
    //开始动画
    _animationController.forward();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('组合动画'),),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Container(
                height: _sizeAnimation1.value,
                width: _sizeAnimation1.value,
                color: _colorAnimation1.value
              ),
            ),
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
    );
  }
}