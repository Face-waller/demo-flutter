import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
        children: [
          ListTile(
            leading: Icon(Icons.phone),
            title: Text("this is list", style: TextStyle(fontSize: 28.0),),
            subtitle: Text('this is list this is list'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text("this is list", style: TextStyle(fontSize: 28.0),),
            subtitle: Text('this is list this is list'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text("this is list", style: TextStyle(fontSize: 28.0),),
            subtitle: Text('this is list this is list'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text("this is list", style: TextStyle(fontSize: 28.0),),
            subtitle: Text('this is list this is list'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text("this is list", style: TextStyle(fontSize: 28.0),),
            subtitle: Text('this is list this is list'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text("this is list", style: TextStyle(fontSize: 28.0),),
            subtitle: Text('this is list this is list'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text("this is list", style: TextStyle(fontSize: 28.0),),
            subtitle: Text('this is list this is list'),
          ),
        ],
      ),
    );
  }
}