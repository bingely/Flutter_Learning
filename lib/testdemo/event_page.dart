import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => new _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('eventpage'),
      ),
      body: Column(
        children: <Widget>[
          // 指针事件
          Listener(
            child: Container(
              color: Colors.red, // 背景色红色
              width: 300,
              height: 300,
            ),
            onPointerDown: (event) => print("down $event"), // 手势按下回调
            onPointerMove: (event) => print("move $event"), // 手势移动回调
            onPointerUp: (event) => print("up $event"), // 手势抬起回调
          )
        ],
      ),
    );
  }
}
