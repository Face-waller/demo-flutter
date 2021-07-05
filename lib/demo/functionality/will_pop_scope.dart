import 'package:flutter/material.dart';

class MyWillPopScope extends StatefulWidget {
  @override
  WillPopScopeTestRouteState createState() {
    return new WillPopScopeTestRouteState();
  }
}

class WillPopScopeTestRouteState extends State<MyWillPopScope> {
  late DateTime _lastPressedAt; //上次点击时间

  @override
  void initState() {
    _lastPressedAt = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('点击两次返回'),),
      body: WillPopScope(
          onWillPop: () async {
            if (DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
              //两次点击间隔超过1秒则重新计时
              _lastPressedAt = DateTime.now();
              return false;
            }
            return true;
          },
          child: Container(
            alignment: Alignment.center,
            child: Text("1秒内连续按两次返回键退出"),
          )
      ),
    );
  }
}