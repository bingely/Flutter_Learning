import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_qyyim/tool/platform_utils.dart';

/// 添加常用Header
class HeaderInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    options.connectTimeout = 1000 * 45;
    options.receiveTimeout = 1000 * 45;

    var appVersion = await PlatformUtils.getAppVersion();
    var version = Map()
      ..addAll({
        'appVerison': appVersion,
      });
    options.headers['version'] = version;
    options.headers['platform'] = Platform.operatingSystem; // 系统信息
    return options;
  }
}


