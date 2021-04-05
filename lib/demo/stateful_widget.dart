import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('有状态的组件'),
        ),
        body: HomePage(),
      )
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}): super(key: key);

  _HomePageState createState()=> _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: [
          Chip(label: Text('${this.count}')),
          RaisedButton(
            child: Text('增加'),
            onPressed: (){
              setState(() {
                this.count++;
              });
            }
          )
        ],
      ),
    );
  }

}