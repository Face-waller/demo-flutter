import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProgress extends StatefulWidget {
  @override
  ProgressState createState() {
    return ProgressState();
  }

}
class ProgressState extends State<MyProgress> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: LinearProgressIndicator(
            value: 0.3,
          ),
        ),
        CircularProgressIndicator(
          value: 0.3,
          backgroundColor: Colors.greenAccent,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
        ),
        CupertinoActivityIndicator(
          radius: 10,
        )
      ],
    );
  }

}