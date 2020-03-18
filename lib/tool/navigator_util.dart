import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///跳转到指定页面
// 这种跳转方式的话,传而外的参数，只能放在Widge的构造函数了，
class NavigatorUtil {
  static push(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  static pushWithCuperino(BuildContext context, Widget page) {
    Navigator.push(context, CupertinoPageRoute(builder: (context) => page));
  }
}
