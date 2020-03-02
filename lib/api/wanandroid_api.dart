import 'package:dio/dio.dart';
import 'package:flutter_qyyim/api/trabel_tab_api.dart';

import 'dio.dart';

String baseUrl = "https://www.wanandroid.com";

fetchChapters() async {
  Response response =
      await dio.get('https://wanandroid.com/wxarticle/chapters/json');
  print("${response.data}===>${response.statusCode}");
}
