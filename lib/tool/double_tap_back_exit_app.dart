
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/tool/toast_util.dart';


// 双击退出的对WillPopScope 封装
class DoubleTapBackExitApp extends StatefulWidget {

  const DoubleTapBackExitApp({
    Key key,
    @required this.child,
    this.duration: const Duration(milliseconds: 2000),
  }): super(key: key);

  final Widget child;
  /// 两次点击返回按钮的时间间隔
  final Duration duration;

  @override
  _DoubleTapBackExitAppState createState() => _DoubleTapBackExitAppState();
}

class _DoubleTapBackExitAppState extends State<DoubleTapBackExitApp> {

  DateTime  _lastTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _isExit,
      child: widget.child,
    );
  }

  Future<bool> _isExit() {
    if (_lastTime == null || DateTime.now().difference(_lastTime) > widget.duration) {
      _lastTime = DateTime.now();
      ToastUtils.show('再次点击退出应用', context);
      return Future.value(false);
    }
    return Future.value(true);
  }
}

