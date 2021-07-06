import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCheckBox extends StatefulWidget {
  @override
  CheckState createState() {
    return CheckState();
  }

}

class CheckState extends State<MyCheckBox> {
  var _checkValue = false;
  var _checkValue1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('复选框'),),
      body: Wrap(
        children: <Widget>[
          Checkbox(
            value: _checkValue,
            activeColor: Colors.red,
            checkColor: Colors.blue,
            onChanged: (value){
              setState(() {
                _checkValue = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Title'),
            value: _checkValue1,
            controlAffinity: ListTileControlAffinity.leading,
            subtitle: Text('一枚有态度的程序员'),
            secondary: Icon(Icons.person),
            onChanged: (value){
              setState(() {
                _checkValue1 = value!;
              });
            },
          ),
        ],
      )
    );
  }

}