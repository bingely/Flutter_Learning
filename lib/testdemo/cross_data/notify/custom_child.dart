// 抽离出一个子 Widget 用来发通知
import 'package:flutter/material.dart';

import 'custom_notification.dart';

class CustomChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      // 按钮点击时分发通知
      onPressed: () => CustomNotification("Hi").dispatch(context),
      child: Text("Fire Notification"),
    );
  }
}