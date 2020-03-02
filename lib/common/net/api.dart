import 'dart:convert';

import 'package:dio/native_imp.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'interceptor/header_interceptor.dart';


// 必须是顶层函数
_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  // 如果你在开发Flutter应用，强烈建议json的解码通过compute方法在后台进行，这样可以避免在解析复杂json时导致的UI卡顿。
  // 注意，根据笔者实际测试，发现通过compute在后台解码json耗时比直接解码慢很多，建议开发者仔细评估。 TODO 验证下
  return compute(_parseAndDecode, text);
}

abstract class BaseHttp extends DioForNative {
  BaseHttp() {
    /// 初始化 加入app通用处理
    (transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
    interceptors..add(HeaderInterceptor());
    init();
  }

  void init();
}

