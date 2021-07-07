import 'package:flutter/material.dart';

class MyDatePicker extends StatefulWidget {
  @override
  DatePickerState createState() {
    return DatePickerState();
  }

}

class DatePickerState extends State<MyDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('日期选择器'),),
      body: Column(
        children: [
          ElevatedButton(
            child: Text('弹出日期组件'),
            onPressed: () async {
              await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2010),
                lastDate: DateTime(2025),
                errorFormatText: '错误的日期格式',
                errorInvalidText: '日期格式非法',
                fieldHintText: '月/日/年',
                fieldLabelText: '填写日期',
                helpText: '选则日期',
                cancelText: '取消',
                confirmText: '确定',
                builder: (context,child){
                  return Theme(
                    data: ThemeData.dark(),
                    child: child!,
                  );
                }
              );
            },
          ),
          CalendarDatePicker(
            initialDate: DateTime.now(),
            firstDate: DateTime(2010),
            lastDate: DateTime(2025),
            onDateChanged: (d) {
              print('$d');
            },
          ),
          ElevatedButton(
            child: Text('范围日期'),
            onPressed: () async {
              var date = showDateRangePicker(context: context, firstDate: DateTime(2010), lastDate: DateTime(2025));
            },
          ),
        ],  
      )
    );
  }


}