import 'package:flutter/material.dart';

class MyRouteTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('路由测试页面'),),
      body: Wrap(
        spacing:10,
        runSpacing: 10,
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.center,
        children: [
          ElevatedButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return APage('B');
              }));
            },
            child: Text('从A到B再返回')
          ),
          ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return APage('C');
                }));
              },
              child: Text('push代替pop')
          ),
        ],
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
        child: ElevatedButton(
          child: Text(btName),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              switch (goName) {
                case 'B':
                  return BPage();
                case 'C':
                  return CPage();

              }
              return BPage();
            }));
          },
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
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}

