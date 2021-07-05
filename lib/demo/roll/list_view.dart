import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('listView'),),
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
          children: List.filled(1000, null, growable: false).map((e) => ListTile(
                  leading: Icon(Icons.phone),
                  title: Text("this is list", style: TextStyle(fontSize: 28.0),),
                  subtitle: Text('this is list this is list'),
                )
          ).toList()
        ),
      ),
    );
  }
}