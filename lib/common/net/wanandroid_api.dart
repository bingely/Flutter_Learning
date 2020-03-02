import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_qyyim/config/storage_manager.dart';

import 'api.dart';
import 'interceptor/api_interceptor.dart';

final Http http = Http();

class Http extends BaseHttp {
  @override
  void init() {
    options.baseUrl = 'https://www.wanandroid.com/';
    interceptors
      ..add(ApiInterceptor())
    // cookie持久化 异步   可能的场景比如 登录后会在cookie中返回账号密码，只要在客户端做cookie持久化存储即可自动登录验证。
      ..add(CookieManager(
          PersistCookieJar(dir: StorageManager.temporaryDirectory.path)));
  }
}