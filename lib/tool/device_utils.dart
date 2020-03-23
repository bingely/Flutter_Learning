
import 'dart:ui';

import 'package:flutter/material.dart';
/// 几个Flutter开发中的常用函数 http://www.mamicode.com/info-detail-2332504.html

class DeviceUtils{
  /// 获取屏幕宽度
  static double winWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

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