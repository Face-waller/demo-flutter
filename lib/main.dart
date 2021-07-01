import 'package:flutter/material.dart';

import 'demo/route_scaffold.dart';
import 'demo/bottom_navigation_bar.dart';
import 'demo/stateful_widget.dart';
import 'demo/wrap.dart';
import 'demo/button.dart';
import 'demo/aspect_ratio.dart';
import 'demo/row.dart';
import 'demo/column.dart';
import 'demo/stack.dart';
import 'demo/padding.dart';
import 'demo/grid_view.dart';
import 'demo/image.dart';
import 'demo/container.dart';
import 'demo/text.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //注册路由表
    Map<String, Widget Function(BuildContext)> routes = {
      "test_text": (context)=> MyText(),
      "test_container": (context)=> MyCOntainer(),
      "test_img": (context)=> MyImg(),
      "test_grid_view": (context)=> MyGridView(),
      "test_padding": (context)=> MyPadding(),
      "test_stack": (context)=> MyStack(),
      "test_column": (context)=> MyColumn(),
      "test_row": (context)=> MyRow(),
      "test_aspect_ratio": (context)=> MyAspectRatio(),
      "test_button": (context)=> MyButton(),
      "test_wrap": (context)=> LayoutDemo(),
      "test_ful_widget": (context)=> HomePage(),
      "test_appbar": (context)=> Tabs(),
      "test_scaffold": (context)=> ScaffoldTest(),
      "test_name_route": (context)=> NewRoute(),

    };

    return MaterialApp(
        home: _RouterTestRoute(),
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        routes: routes ,
        // 注意，onGenerateRoute只会对命名路由生效,在打开命名路由时 "可能" 会被调用
        onGenerateRoute:(RouteSettings settings){
          return MaterialPageRoute(builder: (context){
            String? routeName = settings.name;
            print('名称=> ${routeName}');
            // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
            // 引导用户登录；其它情况则正常打开路由。
          } as Widget Function(BuildContext));
        }
    );
  }
}

class _RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_text");}, child: Text("text测试")),
          ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_container");}, child: Text("container测试")),
          ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_img");}, child: Text("img测试")),
          ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_grid_view");}, child: Text("gridView测试")),
          ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_padding");}, child: Text("padding测试")),
          ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_stack");}, child: Text("stack测试")),
          ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_column");}, child: Text("column测试")),
          ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_row");}, child: Text("row测试")),
          ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_aspect_ratio");}, child: Text("ratio测试")),
          ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_button");}, child: Text("button测试")),
          ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_wrap");}, child: Text("wrap测试")),
          ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_ful_widget");}, child: Text("fulWidget测试")),
          ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_appbar");}, child: Text("appBar测试")),
          ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_scaffold",arguments: '测试含有抽屉!');}, child: Text("Scaffold测试")),
          ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_name_route", arguments: 'hi 命名路由!');}, child: Text("命名路由跳转")),
          ElevatedButton(
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

        ]
    );
  }
}

void main(){
  runApp(MyApp());
}
