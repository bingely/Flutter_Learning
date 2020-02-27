import 'package:flutter/material.dart';

class LayoutPage extends StatefulWidget {
  @override
  _LayoutPageState createState() => new _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('布局demo'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            width: 200,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0), color: Colors.red),
            child: Text(
              "Container（容器）在 UI 框架中是一个很常见的概念，Flutter 也不例外。",
              style: TextStyle(color: Colors.black, fontSize: 12.0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(color: Colors.yellow, width: 60, height: 60),
              // 设置了 flex=1，因此宽度由 Expanded 来分配
              Container(
                color: Colors.red,
                width: 100,
                height: 180,
              ),
              Container(
                color: Colors.black,
                width: 60,
                height: 80,
              ),
              Container(color: Colors.green, height: 60),
              // 设置了 flex=1，因此宽度由 Expanded 来分配
            ],
          ),
          Stack(
            children: <Widget>[
              Container(color: Colors.yellow, width: 300, height: 300),// 黄色容器
              Positioned(
                left: 18.0,
                top: 18.0,
                bottom: 2,
                child: Container(color: Colors.green, width: 50, height: 50),// 叠加在黄色容器之上的绿色控件
              ),
              Positioned(
                left: 18.0,
                top:70.0,
                child: Text("Stack 提供了层叠布局的容器 "),// 叠加在黄色容器之上的文本
              )
            ],
          )
        ],
      ),
    );
  }
}
