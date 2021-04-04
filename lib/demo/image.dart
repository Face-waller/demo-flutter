import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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