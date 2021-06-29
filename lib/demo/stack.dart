/*用 Stack 或者 Stack 结合 Align 或者 Stack 结合 Positiond 来实
现页面的定位布局*/

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Stack'),),
        body: LayoutDemo(),
      )
    );
  }
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        height: 400,
        width: 300,
        color: Colors.red,
        child: Stack(
          children: <Widget>[
            Positioned(child: Icon(Icons.home, size: 40, color: Colors.white,)),
            Positioned(
              bottom: 0,
              left: 100,
              child: Icon(Icons.search, size: 30, color: Colors.white,),
            ),
            Positioned(
              right: 0,
              child: Icon(Icons.settings_applications, size: 30, color: Colors.white,),
            )
          ],
        ),
      ),
    );
  }
}