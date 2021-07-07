import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySwitch extends StatefulWidget {
  @override
  SwitchState createState() {
    return SwitchState();
  }

}

class SwitchState extends State<MySwitch> {
  var _switchValue = false;
  var _switchValue1 = false;
  var _switchValue2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('开关组件'),),
      body: Column(
        children: [
          Switch(
            value: _switchValue,
            activeColor: Colors.red,
            activeTrackColor: Colors.blue,
            onChanged: (value){
              setState(() {
                _switchValue = value;
              });
            },
          ),
          SwitchListTile(
            title:Text('是否允许4G下载'),
            value: _switchValue1,
            onChanged: (value){
              setState(() {
                _switchValue1= value;
              });
            },
          ),
          CupertinoSwitch(
            value: _switchValue2,
            onChanged: (value){
              setState(() {
                _switchValue2 = value;
              });
            },
          ),
        ]
      ),
    );
  }

}