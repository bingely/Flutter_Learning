import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/net/wanandroid_api.dart';

import 'dio.dart';

class WanAndroidRepository {
  // 轮播
  fetchChapters() async {
    Response response = await dio.get('https://wanandroid.com/wxarticle/chapters/json');
    print("${response.data}===>${response.statusCode}");
  }
}

Future fetchBanners() async {
  var response = await http.get('banner/json');

}

fetchChapters() async {
  Response response = await http.get('wxarticle/chapters/json');
}


login(String username, String password) async{
  await http.post('user/login',queryParameters: {'username': username,
    'password': password});
}

/// 登出
logout() async {
  /// 自动移除cookie
  await http.get('user/logout/json');
}
// 收藏列表
fetchCollectList(int pageNum) async{
  await http.get<Map>('lg/collect/list/$pageNum/json');
}

// file test
updateUserPic(String imgurl) async{

  String testfile = "https://resapi-dev.cloudx.cn/dfsfilemgr?accessKeyId=testid&action=uploadDfsImage&file_name=969f5d671f8242bb8b0bd353f427a347.jpg&format=json&reqId=44e31a3bdd754d52a1e7c980f58598d7&signMethod=HMAC-SHA1&signNonce=66038de2aed8490984ddf5323ccc865d&signVersion=1.0&taskTimeOut=30&timeStamp=2020-03-02%2016%3A04%3A17&type=1&user_id=111300&user_type=2&version=2014-05-15&signature=X0V+Q26NxTRJziTZJKeX0X4OLSg=";

  print("imgurl=======>$imgurl");

  FormData formData = FormData.fromMap({
    "file": await MultipartFile.fromFile(imgurl)
  });

  Response response = await Dio().post(testfile, data: formData);
  print("${response.data}===>${response.statusCode}");
}


void getRequest() async {
  // 创建网络调用示例
  Dio dio = new Dio();

  // 设置 URI 及请求 user-agent 后发起请求
  var response = await dio.get("https://flutter.dev", options:Options(headers: {"user-agent" : "Custom-UA"}));

  // 打印请求结果
  if(response.statusCode == HttpStatus.ok) {
    print(response.data.toString());
  } else {
    print("Error: ${response.statusCode}");
  }
}