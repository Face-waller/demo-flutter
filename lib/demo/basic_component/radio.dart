
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyRadio extends StatefulWidget {
  @override
  RadioState createState() {
    return RadioState();
  }

}

class RadioState extends State<MyRadio> {
  String _radioGroupValue = '语文';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('单选组件'),),
      body: Row(
        children: <Widget>[
          Radio(
            value: '语文',
            activeColor: Colors.red,
            groupValue: _radioGroupValue,
            onChanged: (value){
              setState(() {
                _radioGroupValue = value.toString();
              });
            },
          ),
          Radio(
            value: '数学',
            activeColor: Colors.blue,
            groupValue: _radioGroupValue,
            onChanged: (value){
              setState(() {
                _radioGroupValue = value.toString();
              });
            },
          ),
          Radio(
            value: '英语',
            activeColor: Colors.green,
            groupValue: _radioGroupValue,
            onChanged: (value){
              setState(() {
                _radioGroupValue = value.toString();
              });
            },
          ),
          Flexible(
            child: RadioListTile(
              title: Text('语文1'),
              value: '语文1',
              groupValue: _radioGroupValue,
              onChanged: (value) {
                setState(() {
                  _radioGroupValue = value.toString();
                });
              },
            ),
          ),
          Flexible(
              child: RadioListTile(
                title: Text('数学1'),
                value: '数学1',
                groupValue: _radioGroupValue,
                onChanged: (value) {
                  setState(() {
                    _radioGroupValue = value.toString();
                  });
                },
              )),
          Flexible(
              child: RadioListTile(
                title: Text('英语1'),
                value: '英语1',
                groupValue: _radioGroupValue,
                onChanged: (value) {
                  setState(() {
                    _radioGroupValue = value.toString();
                  });
                },
              )),
        ],
      ),
    );
  }

}