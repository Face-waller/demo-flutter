import 'package:flutter/material.dart';
import 'package:demo_flutter/res/listData.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Demo'),),
        body: LayoutContent(),
      )
    );
  }
}

class LayoutContent extends StatelessWidget {
  List<Widget> _getListData() {
    var tempList = listData.map((value){
      return Container(
        child: Column(
          children: <Widget>[
            Image.network(value["imageUrl"]),
            SizedBox(height: 12,),
            Text(value['title'],textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)
          ],
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(230, 230, 230, 0.9),
            width: 1.0
          )
        ),
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(20),
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      children: this._getListData(),
    );
  }
}