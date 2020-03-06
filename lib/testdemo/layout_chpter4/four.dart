import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WrapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('row'),
      ),
      body: Wrap(
        spacing: 8.0, // 主轴(水平)方向间距
        runSpacing: 4.0, // 纵轴（垂直）方向间距
        alignment: WrapAlignment.center,
        children: <Widget>[
          Chip(avatar: CircleAvatar(backgroundColor: Colors.blue,child: Text('A'))),
          //Chip(),
        ],
      ),
    );
  }
}
