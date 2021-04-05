import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('button'),),
        body: MyButton(),
      ),
    );
  }
}


class MyButton extends StatelessWidget {
  _log() {
    print("点击了按钮");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
      onPressed: _log,
      child: Text("浮动按钮"),
    );
  }

}