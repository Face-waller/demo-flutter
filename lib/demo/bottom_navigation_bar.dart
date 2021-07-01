import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  Tabs({Key? key}) : super(key: key);

  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {

  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Demo"),
        ),
        body: Text("tabBar"),
        bottomNavigationBar: BottomNavigationBar(

          currentIndex: this._currentIndex,
          onTap: (int index){
              setState(() {
                  this._currentIndex=index;
              });
          },
          items: [
           BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "首页"   //老版本的Flutter使用title 用法： title: Text("首页")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "分类"
            ),            
            BottomNavigationBarItem(
               icon: Icon(Icons.settings),
               label: "设置"
            )
          ],
        ),
      );
  }
}