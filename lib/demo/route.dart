import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RouterTestRoute(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //注册路由表
      routes:{
        "test_name_route":(context) => NewRoute(),
        // 省略其它路由注册信息
      } ,
      // 注意，onGenerateRoute只会对命名路由生效,在打开命名路由时 "可能" 会被调用
      onGenerateRoute:(RouteSettings settings){
        return MaterialPageRoute(builder: (context){
          String routeName = settings.name;
          print('名称=> ${routeName}');
          // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
          // 引导用户登录；其它情况则正常打开路由。
        });
      }
    );
  }

}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //获取路由参数
    var args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("命名路由 参数传递"),
      ),
      body: Center(
        child: Text(args),
      ),
    );
  }
}

class TipRoute extends StatelessWidget {
  TipRoute({
    Key key,
    @required this.text,  // 接收一个text参数
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[

          RaisedButton(
            onPressed: () async {
              // 打开`TipRoute`，并等待返回结果
              var result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return TipRoute(
                      // 路由参数
                      text: "我是提示xxxx",
                    );
                  },
                  maintainState: true,
                  fullscreenDialog: false,
                ),
              );
              //输出`TipRoute`路由返回结果
              print("路由返回值: $result");
            },
            child: Text("打开提示页"),
          ),

          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, "test_name_route", arguments: 'hi!');
            },
            child: Text("命名路由跳转"),
          ),

        ]
      )
    );
  }
}