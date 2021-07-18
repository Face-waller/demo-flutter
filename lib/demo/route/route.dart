import 'package:flutter/material.dart';

class MyRouteTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/A": (context)=> APage(''),
        "/B": (context)=> BPage(),
        "/C": (context)=> CPage(),
        "/D": (context)=> DPage(),
      },
      home: Scaffold(
        appBar: AppBar(title: Text('路由测试页面'),),
        body: Wrap(
          spacing:10,
          runSpacing: 10,
          runAlignment: WrapAlignment.start,
          alignment: WrapAlignment.start,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).pushNamed("/B");
              },
              child: Text('从A到B再返回')
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).pushNamed("/C");
              },
              child: Text('push代替pop')
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).pushNamed("/D");
              },
              child: Text('pushReplacementNamed')
            ),
            ElevatedButton(
              child: Text('maybePop'),
              onPressed: () {
                Navigator.of(context).maybePop();
              }
            ),
            ElevatedButton(
              child: Text('canPop'),
              onPressed: () {
                if (Navigator.canPop(context)) {
                  print('可以pop');
                  Navigator.of(context).pop();
                }
              }
            ),
          ],
        ),
      ),
    );
  }
  
}
class APage extends StatelessWidget {
  late final String goName;
  
  APage(goName) {
    this.goName = goName;
  }
  
  @override
  Widget build(BuildContext context) {
    String btName = '去往' + goName;
    return Scaffold(
      appBar: AppBar(title: Text('A 页面'),),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            ElevatedButton(
              child: Text(btName),
              onPressed: () {
                switch (goName) {
                  case 'B':
                    Navigator.pushNamed(context, "/B");
                    break;
                  case 'C':
                    Navigator.pushNamed(context, "/C");
                    break;
                  case 'D':
                    Navigator.pushNamed(context, "/D");
                    break;
                }
                Navigator.pushNamed(context, "/B");
              }
            ),
          ],
        ),
      ),
    );
  }
}

class BPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('B 页面'),),
      body: Container(
        alignment: Alignment.center,
        child: ElevatedButton(
          child: Text('退出当前页'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}

class CPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('C 页面'),),
      body: Container(
        alignment: Alignment.center,
        child: ElevatedButton(
          child: Text('去往 A'),
          onPressed: () {
            Navigator.pushNamed(context, "/A");
          },
        ),
      ),
    );
  }
}

class DPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('D 页面'),),
      body: Column(
        children: [
          ElevatedButton(
            child: Text('pushReplacementNamed 去往 B'),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed("/B");
            },
          ),
          ElevatedButton(
            child: Text('pushReplacementNamed 去往 B'),
            onPressed: () {
              Navigator.of(context).popAndPushNamed("/B");
            },
          )
        ],
      ),
    );
  }
  
}


