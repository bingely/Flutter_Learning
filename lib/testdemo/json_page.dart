import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/net/rxhttp/NetCallBack.dart';
import 'package:flutter_qyyim/common/net/rxhttp/rxdio.dart';

import 'bean/student.dart';

class JsonPage extends StatefulWidget {
  @override
  _JsonPageState createState() => new _JsonPageState();
}

class _JsonPageState extends State<JsonPage> {
  String jsonString = '''
    {
      "id":"123",
      "name":"张三",
      "score" : 95,
      "teacher": 
         {
           "name": "李四",
           "age" : 40
         }
    }
    ''';

  @override
  void initState() {
    RxDio.initDatabase();
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
        title: new Text('jsondemo'),
      ),
      body: RaisedButton(
        onPressed: () {
          // 如果 JSON 的数据格式比较复杂，数据量又大，这种解析方式可能会造成短期 UI 无法响应
          parseStudent(jsonString);
          /*compute(parseStudent, jsonString)
              .then((student) => {print(student.teacher.name)});*/


          RxDio<String>()
            ..setBaseUrl("https://www.wanandroid.com/")
            ..setPath("wxarticle/chapters/json")
            ..setMethord(REQUEST_METHORD.GET)
            ..setCacheMode(CacheMode.FIRST_CACHE_THEN_REQUEST)
            ..call(
              new NetCallback(
                onCacheFinish: (data) {
                  print("缓存回调：" + data);
                },
                onNetFinish: (data) {
                  print("网络回调：" + data);
                },
                onUnkownFinish: (data) {
                  print("未知回调：" + data);
                },
              ),
            );
        },
        child: Text("解析"),
      ),
    );
  }

  Student parseStudent(String content) {
    final jsonResponse = json.decode(content);
    Student student = Student.fromJson(jsonResponse);
    print(student.teacher.name);
    return student;
  }
}
