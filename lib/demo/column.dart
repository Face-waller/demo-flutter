import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Row",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Row"),
        ),
        body: Container(
          child: Column(
            //子组件沿着 Cross 轴（在 Row 中是纵轴）如何摆放，其实就是子组件对齐方式，可选值有：
            //CrossAxisAlignment.start：子组件在 Row 中顶部对齐
            //CrossAxisAlignment.end：子组件在 Row 中底部对齐
            //CrossAxisAlignment.center：子组件在 Row 中居中对齐
            //CrossAxisAlignment.stretch：拉伸填充满父布局
            //CrossAxisAlignment.baseline：在 Row 组件中会报错
            crossAxisAlignment: CrossAxisAlignment.start,
            //子组件沿着 Main 轴（在 Row 中是横轴）如何摆放，其实就是子组件排列方式，可选值有：
            //MainAxisAlignment.start：靠左排列
            //MainAxisAlignment.end：靠右排列
            //MainAxisAlignment.center：居中排列
            //MainAxisAlignment.spaceAround：每个子组件左右间隔相等，也就是 margin 相等
            //MainAxisAlignment.spaceBetween：两端对齐，也就是第一个子组件靠左，最后一个子组件靠右，剩余组件在中间平均分散排列
            //MainAxisAlignment.spaceEvenly：每个子组件平均分散排列，也就是宽度相等
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //Main 轴大小，可选值有：
            //MainAxisSize.max：相当于 Android 的 match_parent
            //MainAxisSize.min：相当于 Android 的 wrap_content
            mainAxisSize: MainAxisSize.max,
            //不太理解
//            textBaseline: TextBaseline.alphabetic,
            //子组件排列顺序，可选值有：
            //TextDirection.ltr：从左往右开始排列
            //TextDirection.rtl：从右往左开始排列
            textDirection: TextDirection.ltr,
            //确定如何在垂直方向摆放子组件，以及如何解释 start 和 end，指定 height 可以看到效果，可选值有：
            //VerticalDirection.up：Row 从下至上开始摆放子组件，此时我们看到的底部其实是顶部
            //VerticalDirection.down：Row 从上至下开始摆放子组件，此时我们看到的顶部就是顶部
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Color(0xFFFF0000),
                  child: Text(
                    "Text1",
                    style: TextStyle(fontSize: 30.0),
                  ),
                )
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Color(0xFFFFFF00),
                  child: Text(
                    "Text2",
                    style: TextStyle(fontSize: 30.0),
                  ),
                )
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Color(0xFF00FF00),
                  child: Text(
                    "Text3",
                    style: TextStyle(fontSize: 30.0),
                  ),
                )
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  color: Color(0xFF0000FF),
                  child: Text(
                    "Text4",
                    style: TextStyle(fontSize: 30.0),
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
————————————————
版权声明：本文为CSDN博主「禽兽先生不禽兽」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/zgcqflqinhao/article/details/85239084*/