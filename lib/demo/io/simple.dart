import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MySimpleStore extends StatefulWidget {
  @override
  _MySimpleStoreState createState() => _MySimpleStoreState();

}

class _MySimpleStoreState extends State<MySimpleStore> {
  _saveData() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt('Key_Int', 12);
  }

  Future<int> _readData() async {
    var prefs = await SharedPreferences.getInstance();
    var result = prefs.getInt('Key_Int');
    return result ?? 0;
  }

  bool showDialog1 = false;
  String dialogStr = '';

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
          }, child: Text('读数剧')),
          showDialog1 ? SimpleDialog(
            title: Text('提示'),
            children: <Widget>[
              Container(
                height: 80,
                alignment: Alignment.center,

                child: Text('${dialogStr}'),
              ),
              Divider(height: 1,),
              Divider(height: 1,),
              ElevatedButton(
                child: Text('确认'),
                onPressed: () {
                  setState(() {
                    showDialog1 = false;
                  });
                },
              ),
            ],
          ) :
        ],
      ),
    );
  }

}