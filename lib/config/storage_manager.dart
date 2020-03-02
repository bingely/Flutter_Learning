import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  /// app全局配置
  static SharedPreferences sp;

  /// 临时目录 eg: cookie
  static Directory temporaryDirectory;




  /// 必备数据的初始化操作
  static init() async {
    // async 异步操作
    // sync 同步操作
    sp = await SharedPreferences.getInstance();

    temporaryDirectory = await getTemporaryDirectory();
  }
}
