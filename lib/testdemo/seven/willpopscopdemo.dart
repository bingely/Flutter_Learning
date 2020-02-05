import 'package:flutter/material.dart';

/// 导航返回拦截
/// 为了防止用户误触返回键退出，我们拦截返回事件。当用户在1秒内点击两次返回按钮时，则退出；
/// 如果间隔超过1秒则不退出，并重新记时
class WillPopScopeDemo extends StatefulWidget {
  @override
  WillPopScopeState createState() {
    return WillPopScopeState();
  }
}

class WillPopScopeState extends State<WillPopScopeDemo> {
  DateTime _lastPressTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_lastPressTime == null ||
            DateTime.now().difference(_lastPressTime) > Duration(seconds: 1)) {
          return false;
        }
        return true;
      },
      child: Container(
        child: Text("1秒内连续按两次返回键退出"),
        alignment: Alignment.center,
      ),
    );
  }
}
