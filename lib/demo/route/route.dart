/*
路由传递数据
第一种：通过构造函数方式,此种方式无法用于命名路由的跳转方式
第二种：通过命名路由设置参数的方式,push 相关方法返回 Future 类型，使用 await 等待返回结果
*/

import 'package:flutter/material.dart';

class MyRouteTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('路由测试页面'),),
      body: Wrap(
        spacing:10,
        runSpacing: 10,
        runAlignment: WrapAlignment.start,
        alignment: WrapAlignment.start,
        children: [
          ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context,"/A",arguments: 'B');

              },
              child: Text('从A到B再返回')
          ),
          ElevatedButton(
              onPressed: (){
                Navigator.of(context).pushNamed("/A",arguments: 'C');
              },
              child: Text('push代替pop')
          ),
          ElevatedButton(
              onPressed: (){
                Navigator.of(context).pushNamed("/A",arguments: 'D');
              },
              child: Text('pushReplacementNamed、popAndPushNamed、pushNamedAndRemoveUntil、popUntil')
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
          ElevatedButton(
              child: Text('自定义独立路由'),
              onPressed: () {
                Navigator.of(context).pushNamed("/E");
              }
          ),
        ],
      ),
    );
  }
  
}
class APage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String btName = '去往' + "${ModalRoute.of(context)!.settings.arguments}";
    return Scaffold(
      appBar: AppBar(title: Text('A 页面'),),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            ElevatedButton(
              child: Text(btName),
              onPressed: () {
                switch (ModalRoute.of(context)!.settings.arguments) {
                  case 'B':
                    Navigator.pushNamed(context, "/B");
                    break;
                  case 'C':
                    Navigator.pushNamed(context, "/C");
                    break;
                  case 'D':
                    Navigator.pushNamed(context, "/D");
                    break;
                  default:
                    Navigator.pushNamed(context, "/B");
                }
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
            Navigator.of(context).pop('B 页面返回时的传值');
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
            onPressed:  () async {
              var result = await Navigator.of(context).pushReplacementNamed("/B");
              print(result);
            },
          ),
          ElevatedButton(
            child: Text('popAndPushNamed 去往 B'),
            onPressed: () {
              Navigator.of(context).popAndPushNamed("/B");
            },
          ),
          ElevatedButton(
            child: Text('pushNamedAndRemoveUntil 去往 B, 同时删除直到test_route的路由'),
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil("/B", ModalRoute.withName("test_route"));
            },
          ),
          ElevatedButton(
            child: Text('返回直到test_route的路由'),
            onPressed: () {
              Navigator.of(context).popUntil(ModalRoute.withName("test_route"));
            },
          )
        ],
      ),
    );
  }
}

class EPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('E 页面'),),
      body: Center(
        child: Container(
          height: 350,
          width: 300,
          child: Navigator(
            initialRoute: '/',
            onGenerateRoute: (RouteSettings settins) {
              late WidgetBuilder builder;
              switch (settins.name) {
                case '/':
                  builder = (context) => PageC();
                  break;
              }
              return MaterialPageRoute(builder: builder);
            },
          ),
        ),
      )
    );
  }
}

class PageC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          children: <Widget>[
            _buildItem(Icons.clear, '不感兴趣', '减少这类内容',(){}),
            Divider(),
            _buildItem(Icons.access_alarm, '举报', '标题夸张，内容质量差 等',
                () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return PageD();
                  }));
                }),
            Divider(),
            _buildItem(Icons.perm_identity, '拉黑作者：新华网客户端', '', (){}),
            Divider(),
            _buildItem(Icons.account_circle, '屏蔽', '军事视频、驾驶员等', (){}),
          ],
        ),
      ),
    );
  }

  _buildItem(IconData iconData, String title, String content,
      Function onPress) {
    return Row(
      children: <Widget>[
        Icon(iconData),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontSize: 18),
              ),
              Text(
                content,
                style: TextStyle(
                    color: Colors.black.withOpacity(.5), fontSize: 14),
              )
            ],
          ),
        ),
        IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          iconSize: 16,
          onPressed: (){
            onPress();
          },
        ),
      ],
    );
  }
}

class PageD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 250,
      color: Colors.grey.withOpacity(.5),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Text('返回'),
              SizedBox(
                width: 30,
              ),
              Text('举报'),
            ],
          ),
        ],
      ),
    );
  }
}

