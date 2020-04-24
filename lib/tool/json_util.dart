import 'package:flutter/services.dart';
import 'package:flutter_qyyim/config/app.dart';

class JsonUtils {
  /// 加载json资源的
  /// 模拟耗时操作，然后拿到json数据
  static Future<String> loadString(String jsonName) async {
    return  rootBundle.loadString(AppConstants.mockData + '$jsonName');
  }
}
