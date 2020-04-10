
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
/// 几个Flutter开发中的常用函数 http://www.mamicode.com/info-detail-2332504.html

class DeviceUtils{

  /*
  * 以下两行设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，
  * 覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
  */
  static setBarStatus(bool isDarkIcon, {Color color: Colors.transparent}) async{
    if (Platform.isAndroid) {
      if (isDarkIcon) {
        SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
            statusBarColor: color, statusBarIconBrightness: Brightness.dark);
        SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
      } else {
        SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
            statusBarColor: color, statusBarIconBrightness: Brightness.light);
        SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
      }
    }
  }

  /// 横屏
  static setPreferredOrientationHorizol(){
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }
  ///全屏显示
  static setEnabledSystemUIOverlays(){
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  /// 获取屏幕宽度
  static double winWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  ///获取屏幕高度
  static double winHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
  static double winTop(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static double winBottom(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  static double winLeft(BuildContext context) {
    return MediaQuery.of(context).padding.left;
  }

  static double winRight(BuildContext context) {
    return MediaQuery.of(context).padding.right;
  }

  static double winKeyHeight(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom;
  }

  static double statusBarHeight(BuildContext context) {
    return MediaQueryData.fromWindow(window).padding.top;
  }

  static double navigationBarHeight(BuildContext context) {
    return kToolbarHeight;
  }

  static double topBarHeight(BuildContext context) {
    return kToolbarHeight + MediaQueryData.fromWindow(window).padding.top;
  }
}