/// 多重限制时，对于minWidth和minHeight来说，是取父子中相应数值较大的。实际上，只有这样才能保证父限制与子限制不冲突。

import 'package:flutter/material.dart';

Widget redBox=DecoratedBox(
  decoration: BoxDecoration(color: Colors.red),
);
class MySize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('size demo')
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: double.infinity, //宽度尽可能大
                  // maxWidth: 100, // 最大宽度
                  minHeight: 50.0, //最小高度
                  maxHeight: 100, // 最大高度
                ),
                child: Container(
                    height: 200.0,
                    child: redBox
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(16),
                child: SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: redBox
                )
            ),
            Padding(
                padding: EdgeInsets.all(16),
                child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),  //父
                    child: UnconstrainedBox( //“去除”父级限制
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
                        child: redBox,
                      ),
                    )
                )
            ),
            Padding(
                padding: EdgeInsets.all(16),
                child: AspectRatio(
                  aspectRatio: 2.0/1.0,
                  child: redBox,
                )
            ),
          ],
        )
    );
  }
}
