import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/service/wanandroid_service.dart';


class DioPage extends StatefulWidget {

  @override
  _DioPageState createState() => new _DioPageState();
}

class _DioPageState extends State<DioPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('diodemo'),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              // getRequest();
              //    fetchTravelTab();
              fetchChapters();
              fetchBanners();

              login("bingley","bingleywan");
            },
            child: Text("请求/并登录"),
          ),
          RaisedButton(
            onPressed: () {
              logout();
            },
            child: Text("退出"),
          ),
          RaisedButton(
            onPressed: () {
              fetchCollectList(0);
            },
            child: Text("收藏"),
          )
        ],
      ),

    );
  }

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





