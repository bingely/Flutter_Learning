import 'package:dio/dio.dart';
import 'package:flutter_qyyim/pages/login/constants.dart';
import 'package:flutter_qyyim/tool/shared_util.dart';

String github = "https://api.github.com/orgs/flutterchina/repos";


final githubDio = Dio()
  ..options = BaseOptions(baseUrl: 'https://api.github.com/', connectTimeout: 30, receiveTimeout: 30)
  ..interceptors.add(AuthInterceptor())
  ..interceptors.add(LogInterceptor(responseBody: true, requestBody: true));

/// 添加header认证
class AuthInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options) {
    final token = SharedUtil.instance.getString(KEY_TOKEN);

    options.headers.update("Authorization", (_) => token, ifAbsent: () => token);
    return super.onRequest(options);
  }
}

