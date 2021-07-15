import 'package:flutter/material.dart';

class MyPadding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Demo'),),
      body: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            children:<Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Image.asset('images/a.jpeg',
                  fit: BoxFit.cover,
                ),),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Image.asset('images/a.jpeg',
                  fit: BoxFit.cover,
                ),),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Image.asset('images/a.jpeg',
                  fit: BoxFit.cover,
                ),),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Image.asset('images/a.jpeg',
                  fit: BoxFit.cover,
                ),),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Image.asset('images/a.jpeg',
                  fit: BoxFit.cover,
                ),),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Image.asset('images/a.jpeg',
                  fit: BoxFit.cover,
                ),),
            ],
          )
      ),
    );
  }

}