import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  _log() {
    print("点击了按钮");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('button'),),
      body: ElevatedButton(
        onPressed: _log,
        child: Text("浮动按钮"),
      )
    );
  }

}