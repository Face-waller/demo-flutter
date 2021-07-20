import 'package:flutter/material.dart';

class MyHero extends StatefulWidget {
  @override
  _MyHeroState createState() => _MyHeroState();
}

class _MyHeroState extends State<MyHero> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero动画'),),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 3
        ),
        children: List.generate(10, (index) {
          if (index == 6) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => new _Hero1Demo())
                );
              },
              child: Hero(
                tag: 'hero',
                child: Container(
                  child: Image.asset(
                    'images/a.jpeg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            );
          }
          return Container(
            color: Colors.red,
          );
        }),
      ),
    );
  }
}

class _Hero1Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.topCenter,
        child: Hero(
          tag: 'hero',
          child: Container(
            child: Image.asset(
              'images/a.jpeg',
            ),
          ),
        )
      ),
    );
  }
}