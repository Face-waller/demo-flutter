import 'package:demo_flutter/demo/animation/animation_controller.dart';
import 'package:demo_flutter/demo/container/scaffold.dart';
import 'package:flutter/material.dart';

import 'demo/basic_component/check_box.dart';
import 'demo/basic_component/radio.dart';
import 'demo/basic_component/slider.dart';
import 'demo/container/decorated_box.dart';
import 'demo/container/size_limit.dart';
import 'demo/container/transform.dart';
import 'demo/functionality/date_picker.dart';
import 'demo/functionality/ios_date_picker.dart';
import 'demo/functionality/ios_time_picker.dart';
import 'demo/functionality/time_picker.dart';
import 'demo/functionality/will_pop_scope.dart';
import 'demo/gesture/gesture_detector.dart';
// import 'demo/other/route.dart';
import 'demo/basic_component/bottom_navigation_bar.dart';
import 'demo/basic_component/stateful_widget.dart';
import 'demo/layout/wrap.dart';
import 'demo/basic_component/button.dart';
import 'demo/layout/row.dart';
import 'demo/layout/column.dart';
import 'demo/layout/stack.dart';
import 'demo/container/padding.dart';
import 'demo/roll/grid_view.dart';
import 'demo/basic_component/image.dart';
import 'demo/container/container.dart';
import 'demo/basic_component/text.dart';
import 'demo/roll/list_view.dart';
import 'demo/roll/single_child_scroll_view.dart';
import 'demo/route/route.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // 基础组件
    Map<String, Widget Function(BuildContext)> routes_basic = {
      "test_text": (context)=> MyText(),
      "test_img": (context)=> MyImg(),
      "test_button": (context)=> MyButton(),
      "test_radio": (context)=> MyRadio(),
      "test_ful_widget": (context)=> HomePage(),
      "test_appbar": (context)=> Tabs(),
      "test_check_box": (context)=> MyCheckBox(),
      "test_slider": (context)=> MySlider(),
    };

    // 容器类组件
    Map<String, Widget Function(BuildContext)> routes_container = {
      "test_container": (context)=> MyContainer(),
      "test_padding": (context)=> MyPadding(),
      "test_size_limit": (context)=> MySize(),
      "test_decorated": (context)=> MyDecorated(),
      "test_transform": (context)=> MyTransform(),
      "test_scaffold": (context)=> MyScaffold(),
    };

    // 滚动组件
    Map<String, Widget Function(BuildContext)> routes_roll = {
      "test_grid_view": (context)=> MyGridView(),
      "test_single_child_scroll_view": (context)=> MySingleChildScrollView(),
      "test_list_view": (context)=> MyListView(),
    };

    // 布局组件
    Map<String, Widget Function(BuildContext)> routes_layout = {
      "test_stack": (context)=> MyStack(),
      "test_column": (context)=> MyColumn(),
      "test_row": (context)=> MyRow(),
      "test_wrap": (context)=> LayoutDemo(),
    };

    // 功能性组件
    Map<String, Widget Function(BuildContext)> routes_functionality = {
      "test_will_pop": (context)=> MyWillPopScope(),
      "test_date_picker": (context)=> MyDatePicker(),
      "test_time_picker": (context)=> MyTimePicker(),
      "test_ios_date_picker": (context)=> MyIosDatePicker(),
      "test_ios_time_picker": (context)=> MyIosTimePicker(),
    };

    // 手势
    Map<String, Widget Function(BuildContext)> routes_gesture = {
      "test_gesture_detector": (context)=> MyGestureDetector(),
    };

    // 路由
    Map<String, Widget Function(BuildContext)> routes_route = {
      "test_route": (context)=> MyRouteTest(),
    };

    // 动画
    Map<String, Widget Function(BuildContext)> routes_animation = {
      "test_animation_controller": (context)=> MyAnimationController(),
    };

    // 其他组件
    Map<String, Widget Function(BuildContext)> routes_other = {
      // TODO
    };


    //注册路由表
    Map<String, Widget Function(BuildContext)> routes = {};

    routes.addAll(routes_basic);
    routes.addAll(routes_container);
    routes.addAll(routes_roll);
    routes.addAll(routes_layout);
    routes.addAll(routes_functionality);
    routes.addAll(routes_gesture);
    routes.addAll(routes_route);
    routes.addAll(routes_animation);
    routes.addAll(routes_other);

    routes.addAll({
      "/A": (context)=> APage(),
      "/B": (context)=> BPage(),
      "/C": (context)=> CPage(),
      "/D": (context)=> DPage(),
      "/E": (context)=> EPage(),
    });

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('首页'),
            leading: Builder(builder: (context) {
              return IconButton(
                icon: Icon(Icons.menu, color: Colors.white), //自定义图标
                onPressed: () {
                  // 打开抽屉菜单
                  Scaffold.of(context).openDrawer();
                },
              );
            }),
          ),
          drawer: new _HomeDrawer(), //抽屉
          body: Home(),
        ),
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

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('首页');
  }
}

class _HomeDrawer extends StatelessWidget {
  List<Widget> _getBasic(context) {
    return <Widget> [
      ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_text");}, child: Text("text测试")),
      ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_img");}, child: Text("img测试")),
      ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_button");}, child: Text("button测试")),
      ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_radio");}, child: Text("radio测试")),
      ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_ful_widget");}, child: Text("fulWidget测试")),
      ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_appbar");}, child: Text("appBar测试")),
      ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_check_box");}, child: Text("checkBox测试")),
      ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_slider");}, child: Text("Slider")),

    ];
  }
  List<Widget> _getContainer(context) {
    return <Widget> [
      ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_container");}, child: Text("container测试")),
      ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_padding");}, child: Text("padding测试")),
      ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_size_limit");}, child: Text("限制型容器")),
      ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_decorated");}, child: Text("装饰类容器")),
      ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_transform");}, child: Text("变换容器")),
      ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_scaffold");}, child: Text("scaffold容器")),

    ];
  }
  List<Widget> _getRoll(context) {
    return <Widget> [
      ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_grid_view");}, child: Text("gridView测试")),
      ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_single_child_scroll_view");}, child: Text("singleChildScrollView")),
      ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_list_view");}, child: Text("listView")),

    ];
  }
  List<Widget> _getLayout(context) {
    return <Widget> [
      ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_stack");}, child: Text("stack测试")),
      ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_column");}, child: Text("column测试")),
      ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_row");}, child: Text("row测试")),
      ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_wrap");}, child: Text("wrap测试")),

    ];
  }
  List<Widget> _getFunctionality(context) {
    return <Widget> [
      ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_will_pop");}, child: Text("WillPopScope")),
      ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_date_picker");}, child: Text("DatePicker")),
      ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_time_picker");}, child: Text("TimePicker")),
      ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_ios_date_picker");}, child: Text("IosDatePicker")),
      ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_ios_time_picker");}, child: Text("IosTimePicker"))

    ];
  }
  List<Widget> _getGesture(context) {
    return <Widget> [
      ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_gesture_detector");}, child: Text("Gesture")),

    ];
  }
  List<Widget> _getRoute(context) {
    return <Widget> [
      ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_route");}, child: Text("Route路由")),

    ];
  }
  List<Widget> _getAnimation(context) {
    return <Widget> [
      ElevatedButton(onPressed: () {Navigator.pushNamed(context, "test_animation_controller");}, child: Text("动画")),

    ];
  }
  List<Widget> _getOther(context) {
    return <Widget> [];
  }

  List<Widget> _expandChildFormatter(List<Widget> oldList) {
    return oldList.asMap().keys.map((i) =>
      Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: oldList[i],
      )
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                  child: Text('目录')
              ),
              ExpansionTile(
                initiallyExpanded: true,
                backgroundColor: Colors.black54,
                title: Text('基础组件'),
                children: _expandChildFormatter(_getBasic(context)),
              ),
              ExpansionTile(
                initiallyExpanded: true,
                backgroundColor: Colors.black54,
                title: Text('容器组件'),
                children: _expandChildFormatter(_getContainer(context)),
              ),
              ExpansionTile(
                initiallyExpanded: true,
                backgroundColor: Colors.black54,
                title: Text('滚动组件'),
                children: _expandChildFormatter(_getRoll(context)),
              ),
              ExpansionTile(
                initiallyExpanded: true,
                backgroundColor: Colors.black54,
                title: Text('布局组件'),
                children: _expandChildFormatter(_getLayout(context)),
              ),
              ExpansionTile(
                initiallyExpanded: true,
                backgroundColor: Colors.black54,
                title: Text('功能性组件'),
                children: _expandChildFormatter(_getFunctionality(context)),
              ),
              ExpansionTile(
                initiallyExpanded: true,
                backgroundColor: Colors.black54,
                title: Text('手势组件'),
                children: _expandChildFormatter(_getGesture(context)),
              ),
              ExpansionTile(
                initiallyExpanded: true,
                backgroundColor: Colors.black54,
                title: Text('路由测试'),
                children: _expandChildFormatter(_getRoute(context)),
              ),
              ExpansionTile(
                initiallyExpanded: true,
                backgroundColor: Colors.black54,
                title: Text('动画组件'),
                children: _expandChildFormatter(_getAnimation(context)),
              ),
              ExpansionTile(
                initiallyExpanded: true,
                backgroundColor: Colors.black54,
                title: Text('其他组件'),
                children: _expandChildFormatter(_getOther(context)),
              ),
            ]
        )
      ),
    );
  }
}



void main(){
  runApp(MyApp());
}
