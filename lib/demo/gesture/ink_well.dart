import 'package:flutter/material.dart';

class MyInkWell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('点击波纹'),),
      body: Center(
        child: Column(
          children: [
            InkWell(
              onTap: (){},
              splashColor: Colors.red,
              // highlightColor: Colors.blue,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                decoration: BoxDecoration(
                    border:Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(30))

                ),
                child: Text('这是InkWell点击效果'),
              ),
            ),
            Ink(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFDE2F21), Color(0xFFEC592F)]
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Text(
                    '这是InkWell的点击效果',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }

}