import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//https://blog.csdn.net/qq_17766199/article/details/104745624
class KeyPageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> widgets;

  @override
  void initState() {
    super.initState();
    widgets = [StatelessColorfulTile(), StatelessColorfulTile()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        children: widgets,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: _swapTile,
      ),
    );
  }

  _swapTile() {
    setState(() {
      widgets.insert(1, widgets.removeAt(0));
    });
  }
}

class StatelessColorfulTile extends StatelessWidget {
  final Color _color = Utils.randomColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      color: _color,
    );
  }
}

class Utils {
  static Color randomColor() {
    var red = Random.secure().nextInt(255);
    var greed = Random.secure().nextInt(255);
    var blue = Random.secure().nextInt(255);
    return Color.fromARGB(255, red, greed, blue);
  }
}
