

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../not_sucess_exception.dart';
import '../response_data.dart';
import '../wanandroid_api.dart';

// 封装的是解析数据过程
class ApiInterceptor extends Interceptor{
  @override
  onRequest(RequestOptions options) async {
    debugPrint('---api-request--->url--> ${options.baseUrl}${options.path}' +
        ' queryParameters: ${options.queryParameters}');
//    debugPrint('---api-request--->data--->${options.data}');
    return options;
  }

  @override
  onResponse(Response response) {
//    debugPrint('---api-response--->resp----->${response.data}');
    ResponseData respData = ResponseData.fromJson(response.data);
    print("---api-response--statusCode--->${response.statusCode}\ndata-->${response.data}");
    if (respData.success) {
      response.data = respData.data;
      return http.resolve(response);
    } else {
      if (respData.code == -1001) {
        // 如果cookie过期,需要清除本地存储的登录信息
        // StorageManager.localStorage.deleteItem(UserModel.keyUser);
        throw const UnAuthorizedException(); // 需要登录
      } else {
        throw NotSuccessException.fromRespData(respData);
      }
    }
  }
}