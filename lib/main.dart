import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'config/provider_config.dart';
import 'config/storage_manager.dart';

Future<void> main() async {
  /// 确保初始化
  WidgetsFlutterBinding.ensureInitialized();

  /// 配置初始化
  await StorageManager.init();

  /// APP入口并配置Provider
  runApp(ProviderConfig.getInstance().getGlobal(MyApp()));

  /// Android状态栏透明
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
