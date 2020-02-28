import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
        title: new Text('jsondemo'),
      ),
      body: RaisedButton(
        onPressed: () {
          // 如果 JSON 的数据格式比较复杂，数据量又大，这种解析方式可能会造成短期 UI 无法响应
          compute(parseStudent, jsonString)
              .then((student) => {print(student.teacher.name)});
        },
        child: Text("解析"),
      ),
    );
  }

  Student parseStudent(String content) {
    final jsonResponse = json.decode(content);
    Student student = Student.fromJson(jsonResponse);
    return student;
  }
}
