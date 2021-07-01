import 'package:flutter/material.dart';

class MyImg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        /*child: Image.network(
          "http://www.ionic.wang/statics/index/images/ionic4.png",
          alignment: Alignment.topLeft,
          color: Colors.red,
          colorBlendMode: BlendMode.colorDodge,
          repeat: ImageRepeat.repeatX,
          fit: BoxFit.cover,
        ),*/
        width: 300,
        height: 400,
        decoration: BoxDecoration(
          color: Colors.yellow
        ),
      ),
    );
  }

}