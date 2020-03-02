import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/net/wanandroid_api.dart';

import 'dio.dart';

class WanAndroidRepository {
  // 轮播

  fetchChapters() async {
    Response response =
        await dio.get('https://wanandroid.com/wxarticle/chapters/json');
    print("${response.data}===>${response.statusCode}");
  }
}

Future fetchBanners() async {
  var response = await http.get('banner/json');

}

fetchChapters() async {
  Response response = await http.get('wxarticle/chapters/json');
}
