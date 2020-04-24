
import 'dart:io';
import 'dart:ui';

import 'package:device_info/device_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';
/// 几个Flutter开发中的常用函数 http://www.mamicode.com/info-detail-2332504.html
/// 是否是生产环境
const bool inProduction = const bool.fromEnvironment("dart.vm.product");

class DeviceUtils{

  static bool get isDesktop => !isWeb && (isWindows || isLinux || isMacOS);
  static bool get isMobile => isAndroid || isIOS;
  static bool get isWeb => kIsWeb;

  static bool get isWindows => Platform.isWindows;
  static bool get isLinux => Platform.isLinux;
  static bool get isMacOS => Platform.isMacOS;
  static bool get isAndroid => Platform.isAndroid;
  static bool get isFuchsia => Platform.isFuchsia;
  static bool get isIOS => Platform.isIOS;

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



  static Future<PackageInfo> getAppPackageInfo() {
    return PackageInfo.fromPlatform();
  }

  static Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }
  static Future<String> getBuildNum() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }

  static Future getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      return await deviceInfo.androidInfo;
    } else if (Platform.isIOS) {
      return await deviceInfo.iosInfo;
    } else {
      return null;
    }
  }
}