import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class FileDataPage extends StatefulWidget {
  @override
  _FileDataPageState createState() => new _FileDataPageState();
}

class _FileDataPageState extends State<FileDataPage> {
  @override
  void initState() {
    _localFile;

    initSqlite();

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
        title: new Text(''),
      ),
      body: Column(
        children: <Widget>[
          Text("file操作"),
          RaisedButton(
            onPressed: () {
              writeContent("helloworld");
            },
            child: Text("写"),
          ),
          RaisedButton(
            onPressed: () {
              readContent();
            },
            child: Text("读"),
          ),
          Text("SharedPrefernces 操作"),
          RaisedButton(
            onPressed: () async {

            },
            child: Text("写"),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text("读"),
          ),
          Text("sqlite操作"),
          RaisedButton(
            onPressed: () {},
            child: Text("写"),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text("读"),
          ),
        ],
      ),
    );
  }

  Future<void> initSqlite() async {
//    final Future<Database> database = openDatabase(
//        join(await getDatabasesPath(), 'students_database.db'),
//        onCreate: (db, version)=>db.execute("CREATE TABLE students(id TEXT PRIMARY KEY, name TEXT, score INTEGER)"),
//        version: 1,
//    );
  }
}

// 创建文件目录
Future<File> get _localFile async {
  final directory = await getApplicationDocumentsDirectory();
  final path = directory.path;
  return File('$path/content.txt');
}

// 将字符串写入文件
Future<File> writeContent(String content) async {
  final file = await _localFile;
  return file.writeAsString(content);
}

// 从文件读出字符串
Future<String> readContent() async {
  try {
    final file = await _localFile;
    String contents = await file.readAsString();
    print("readContent$contents");
    return contents;
  } catch (e) {
    return "";
  }
}

// 读取 SharedPreferences 中 key 为 counter 的值
Future<int> _loadCounter() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int counter = (prefs.getInt('counter') ?? 0);
  return counter;
}

// 递增写入 SharedPreferences 中 key 为 counter 的值
Future<void> _incrementCounter() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int counter = (prefs.getInt('counter') ?? 0) + 1;
  prefs.setInt('counter', counter);
}



