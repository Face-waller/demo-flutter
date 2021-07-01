import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}): super(key: key);

  _HomePageState createState()=> _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("有状态的组件"),
      ),
      body: Container(
        child: Column(
          children: [
            Chip(label: Text('${this.count}')),
            ElevatedButton(
                child: Text('增加'),
                onPressed: (){
                  setState(() {
                    this.count++;
                  });
                }
            )
          ],
        ),
      ),
    );
  }
}