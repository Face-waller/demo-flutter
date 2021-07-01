import 'package:flutter/material.dart';

class MyAspectRatio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('AspectRadio'),),
        body: Center(
          child: Container(
            width: 200,
            child: AspectRatio(
              aspectRatio: 2.0/1.0,
              child: Container(
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }

}