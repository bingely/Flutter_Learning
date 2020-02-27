import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/testdemo/cross_data/second_screen_page.dart';

import 'custom_event.dart';
import 'event_bus.dart';
import 'notify/custom_child.dart';
import 'notify/custom_notification.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => new _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String msg = " 通知：";

  String notifymsg = " ";


  StreamSubscription subscription;

  @override
  void initState() {
    subscription = eventBus.on<CustomEvent>().listen((event) {
      setState(() {
        msg += event.msg;
      }); // 更新 msg
    });

    super.initState();
  }

  @override
  void dispose() {
    subscription.cancel(); //State 销毁时，清理注册
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(''),
      ),
      body: Column(children: <Widget>[
        RaisedButton(
          onPressed: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SecondScreen();
          })),
          child: Text("eventbus click$msg"),
        ),

        NotificationListener<CustomNotification>(
            onNotification: (notification) {
              setState(() {notifymsg += notification.msg+"  ";});// 收到子 Widget 通知，更新 msg
            },
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text(notifymsg),CustomChild()],// 将子 Widget 加入到视图树中
            )
        )
      ]),
    );
  }
}
