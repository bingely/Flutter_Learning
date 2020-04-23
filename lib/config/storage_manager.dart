import 'dart:io';

import 'package:flutter_qyyim/common/db/solution1/db_utils.dart';
import 'package:flutter_qyyim/tool/log_utils.dart';
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

    DbUtils.getInstance().openDb("qqyim");

    LogUtil.init();


    /*X5Sdk.setDownloadWithoutWifi(true); //没有x5内核，是否在非wifi模式下载内核。默认false
    X5Sdk.init().then((isOK) {
      print(isOK ? "X5内核成功加载" : "X5内核加载失败");
    });*/
  }
}
