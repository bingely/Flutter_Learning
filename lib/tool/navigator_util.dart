import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// 路由跳转小工具
/// 后期如果页面多的话，改成fluror 会方便
class NavigatorUtil {


  /// *********通过widget方式跳转，这种跳转方式的话,传的参数，只能放在Widge的构造函数了，*******
  static push(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  static pushWithCuperino(BuildContext context, Widget page) {
    Navigator.push(context, CupertinoPageRoute(builder: (context) => page));
  }


  //// *********name************

  static pushReplacementNamed(BuildContext context, String pageName){
    Navigator.pushReplacementNamed(context, pageName);
  }
}
