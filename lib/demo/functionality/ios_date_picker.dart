import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyIosDatePicker extends StatefulWidget {
  @override
  IosDatePickerState createState() {
    return IosDatePickerState();
  }

}

class IosDatePickerState extends State<MyIosDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('IOS日期选择器'),),
      body: Column(
        children: [
          Container(
            height: 200,
            color: Colors.grey.withOpacity(.5),
            child: CupertinoDatePicker(
              initialDateTime: DateTime.now(),
              minimumDate: DateTime.now().add(Duration(days: -1)),
              maximumDate: DateTime.now().add(Duration(days: 1)),
              onDateTimeChanged: (date) {
                print('$date');
              },
            ),  
          ),
          Container(
            height: 200,
            color: Colors.grey.withOpacity(.5),
            child: CupertinoDatePicker(
              initialDateTime: DateTime.now(),
              // mode: CupertinoDatePickerMode.time,  // 日期
              mode: CupertinoDatePickerMode.dateAndTime,  // 日期时间
              minimumDate: DateTime.now().add(Duration(days: -1)),
              maximumDate: DateTime.now().add(Duration(days: 1)),
              onDateTimeChanged: (date) {
                print('$date');
              },
            ),  
          )
        ],
      ),
    );
  }

}