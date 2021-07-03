import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //获取路由参数
    var args = ModalRoute.of(context)!.settings.arguments!;

    return Scaffold(
      appBar: AppBar(
        title: Text("命名路由 参数传递"),
      ),
      body: Center(
        child: Text(args as String),
      ),
    );
  }
}

class TipRoute extends StatelessWidget {
  TipRoute({
    Key? key,
    required this.text,  // 接收一个text参数
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
              ElevatedButton(
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
