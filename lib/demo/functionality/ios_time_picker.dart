import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyIosTimePicker extends StatefulWidget {
  @override
  IosTimePicker createState() {
    return IosTimePicker();
  }

}

class IosTimePicker extends State<MyIosTimePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('IOS时间选择器'),),
      body: Column(
        children: [
          CupertinoTimerPicker(
            onTimerDurationChanged: (time) {
              print('$time');
            },
            initialTimerDuration: Duration(
              hours: DateTime.now().hour,
              minutes: DateTime.now().minute,
              seconds: DateTime.now().second
            ),
          )
        ],
      ),
    );
  }
}