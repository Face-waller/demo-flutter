import 'package:flutter/material.dart';

class MyTimePicker extends StatefulWidget {
  @override
  TimePickerState createState() {
    return TimePickerState();
  }

}

class TimePickerState extends State<MyTimePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('时间选择器'),),
      body: Column(
        children: [
          ElevatedButton(
            child: Text('弹出时间选择器'),
            onPressed: () async {
              var result = showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  helpText: '选择时间',
                  cancelText: '取消',
                  confirmText: '确定',
              );
            },
          )
        ],
      ),
    );
  }

}