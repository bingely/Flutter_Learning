import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_orm_plugin/flutter_orm_plugin.dart';
import 'package:flutter_qyyim/common/db/solution1/db_utils.dart';
import 'package:flutter_qyyim/common/db/student_dao.dart';
import 'package:flutter_qyyim/pages/chat/model/chat_data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'bean/student.dart';

class FileDataPage extends StatefulWidget {
  @override
  _FileDataPageState createState() => new _FileDataPageState();
}

class _FileDataPageState extends State<FileDataPage> {

  @override
  Future<void> initState()  {
    _localFile;


  //  DbUtils.getInstance().openDb("qqyim");


    Map<String , Field> fields = new Map<String , Field>();
    fields["studentId"] = Field(FieldType.Integer, primaryKey: true , autoIncrement: true);
    fields["name"] = Field(FieldType.Text);
   // fields["class"] = Field(FieldType.Text, foreignKey: true, to: "School_Class");
    fields["score"] = Field(FieldType.Real);
    FlutterOrmPlugin.createTable("School2","Student1",fields);
    super.initState();
  }

  @override
  void dispose() {
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
            onPressed: () async {},
            child: Text("写"),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text("读"),
          ),
          Text("sqlite操作"),
          RaisedButton(
            onPressed: () async {

              var student1 = StudentDao(id: '1232', name: '张三1', score: 90);
              var student2 = StudentDao(id: '4563', name: '李四2', score: 80);
              var student3 = StudentDao(id: '7894', name: '王五3', score: 85);

              String json1 = '{"text": "hello", "type": "Text"}';
              var stdent3 = StudentDao(id: '111',name: json1);

              // 插入 3 个 Student 对象



              DbUtils.getInstance().insertItem(student1);
              DbUtils.getInstance().insertItem(student2);
              DbUtils.getInstance().insertItem(student3);
              DbUtils.getInstance().insertItem(stdent3);

              DbUtils.getInstance().insertItem(ChatData(msg:json1,nickName: "bingley",id: '11'));


              Map m = {"name":"william", "class":"class1", "score":96.5};
              FlutterOrmPlugin.saveOrm("Student1", m);

            },
            child: Text("写"),
          ),
          RaisedButton(
            onPressed: () {
              // 读取出数据库中插入的 Student 对象集合
              //students().then((list)=>list.forEach((s)=>print(s.name)));
             /* DbUtils.getInstance().queryItems(StudentDao())
              .then((list)=>list.forEach((StudentDao student){
                print(student.name);
              }));*/

              DbUtils.getInstance().queryItems(ChatData())
                  .then((list)=>list.forEach((ChatData student){
                print(student.nickName);
              }));


              Query("Student1").all().then((List l) {
                print(l[0]['name']);
              });

            },
            child: Text("读"),
          ),
          RaisedButton(
            onPressed: () {
             // DbUtils.getInstance().
            },
            child: Text("改"),
          ),
          RaisedButton(
            onPressed: () {

              DbUtils.getInstance().deleteItem(StudentDao());

            },
            child: Text("删"),
          ),
        ],
      ),
    );
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
