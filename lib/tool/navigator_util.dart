import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// 路由跳转小工具
/// 后期如果页面多的话，改成fluror 会方便
/// 参考文章 https://www.jianshu.com/p/5df089d360e4
class NavigatorUtil {
  /// *********通过widget方式跳转，这种跳转方式的话,传的参数，只能放在Widge的构造函数了，*******
  static push(BuildContext context, Widget page) {
    //Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    FocusScope.of(context).unfocus();
    Navigator.push(context, CupertinoPageRoute(builder: (context) => page));
  }

  /// 关闭自身的页面，跳到新的页面
  static pushReplacement(BuildContext context, Widget page) {
    FocusScope.of(context).unfocus();
    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => page));
  }

  /// 那如何管理某一个页面的关闭情况 : 比如A-B-C,然后C-A-B,怎么去保证A B 的唯一性 TODO

  //// *********name************
  static pushReplacementNamed(BuildContext context, String routeName) {
    FocusScope.of(context).unfocus();
    Navigator.pushReplacementNamed(context, routeName);

    //Navigator.popAndPushNamed(context, routeName);
  }

  /// 如果想在弹出新路由之前，删除路由栈中的所有路由
  static pushNamedAndRemoveUntil_Isdeletall(
      BuildContext context, String newRouteName, bool isDeletall) {
    FocusScope.of(context).unfocus();
    Navigator.pushNamedAndRemoveUntil(
        context, newRouteName, (Route<dynamic> route) => isDeletall);
  }

  /// 如果想在弹出新路由之前，删除路由栈中的部分路由。 比如preRoutName上面有Screen3和Screen2，通过此方法保证了现在只有newRouteName，preRoutName
  /// 比如只弹出Screen1路由上面的Screen3和Screen2，然后再push新的Screen4
  static pushNamedAndRemoveUntil(
      BuildContext context, String newRouteName, String preRoutName) {
    FocusScope.of(context).unfocus();
    Navigator.pushNamedAndRemoveUntil(
        context, '/$newRouteName', ModalRoute.withName('/$preRoutName'));
  }

  /// 通过路由名字，移除指定的页面
  static popUntil(BuildContext context, String routname) {
    Navigator.popUntil(context, ModalRoute.withName("/$routname"));
  }


  /// 返回
  static void goBack(BuildContext context) {
    FocusScope.of(context).unfocus();
    Navigator.pop(context);
  }

  /// 带参数返回
  static void goBackWithParams(BuildContext context, result) {
    FocusScope.of(context).unfocus();
    Navigator.pop(context, result);
  }
}
