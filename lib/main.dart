import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'config/provider_config.dart';
import 'config/storage_manager.dart';

/// 应用入口处
Future<void> main() async {
  /// 确保初始化
  WidgetsFlutterBinding.ensureInitialized();

  /// 配置初始化
  await StorageManager.init();
  /// Provider如果与Listenable/一起使用，现在抛出Stream。考虑使用ListenableProvider/ StreamProvider代替。或者，可以通过设置Provider.debugCheckInvalidValueType 为null这样来禁用此异常***/
 // Provider.debugCheckInvalidValueType = null;

  /// APP入口并配置Provider
  runApp(ProviderConfig.getInstance().getMultiGlobal(MyApp()));

  /// Android状态栏透明
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
