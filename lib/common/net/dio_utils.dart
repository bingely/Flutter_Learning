import 'dart:convert';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/services.dart';
import 'package:flutter_qyyim/config/storage_manager.dart';
import 'package:rxdart/rxdart.dart';

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
      ..add(CookieManager(PersistCookieJar(dir: StorageManager.temporaryDirectory.path)))
      ;
  }
}


/// 通过rxdart 包装一层

Observable post(String url, Map<String, dynamic> params) =>
    Observable.fromFuture(_post(url, params)).asBroadcastStream();

Observable get(String url, {Map<String, dynamic> params}) =>
    Observable.fromFuture(_get(url, params: params)).asBroadcastStream();

Future _post(String url, Map<String, dynamic> params) async {
  var response = await http.post(url, data: params);
  return response.data;
}

Future _get(String url, {Map<String, dynamic> params}) async {
  var response = await http.get(url, queryParameters: params);
  return response.data;
}


/// 可以用于加载本地的json文件逻辑
 Future<dynamic> mock({String action, Map params}) async {
var responseStr = await rootBundle.loadString('mock/$action.json');
var responseJson = json.decode(responseStr);
return responseJson['data'];
}