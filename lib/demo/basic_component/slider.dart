import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  @override
  SliderState createState() {
    return SliderState();
  }

}

class SliderState extends State<MySlider> {
  double _sliderValue = 0;
  double _sliderValue1 = 0;
  RangeValues _rangeValues2 = RangeValues(0, 25);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('slider'),),
      body:  Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('值：$_sliderValue'),
            Slider(
              value: _sliderValue,
              label: '$_sliderValue',
              min: 0,
              max: 100,
              divisions: 4,
              onChanged: (v){
                setState(() {
                  _sliderValue = v;
                });
              },
            ),
            Text('值：$_sliderValue1'),
            CupertinoSlider(
              value: _sliderValue1,
              onChanged: (v) {
                setState(() {
                  _sliderValue1 = v;
                });
              },
            ),
            Text('范围滑块'),
            RangeSlider(
              values: _rangeValues2,
              labels: RangeLabels('${_rangeValues2.start}','${_rangeValues2.end}'),
              min: 0,
              max: 100,
              divisions: 4,
              onChanged: (v) {
                setState(() {
                  _rangeValues2 = v;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

}