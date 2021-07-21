import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MySimpleStore extends StatefulWidget {
  @override
  _MySimpleStoreState createState() => _MySimpleStoreState();

}

class _MySimpleStoreState extends State<MySimpleStore> {
  _saveData() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt('Key_Int', 13);
    _openSimpleDialog('存入成功!');
  }

  Future<int> _readData() async {
    var prefs = await SharedPreferences.getInstance();
    var result = prefs.getInt('Key_Int');
    _openSimpleDialog(result.toString());
    return result ?? 0;
  }

  Future _openSimpleDialog(String content) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('SimpleDialog'),
            children: <Widget>[
              Text(content)
            ],
            elevation: 100.0,
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('简单持久化'),),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            _saveData();
          }, child: Text('存数据')),
          ElevatedButton(onPressed: (){
            print(_readData());
          }, child: Text('读数据')),
        ],
      ),
    );
  }

}

