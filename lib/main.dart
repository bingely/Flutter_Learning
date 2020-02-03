import 'package:flutter/material.dart';
import 'package:flutter_qyyim/app_page.dart';
import 'package:flutter_qyyim/chat/chat_page.dart';
import 'package:flutter_qyyim/load_page.dart';
import 'package:flutter_qyyim/message/message_page.dart';

void main() => runApp(MaterialApp(
  // Flutter去除右上角Debug标签
  debugShowCheckedModeBanner: false,
  title: 'qyyim',
  theme: mDefaultTheme,
  // 路由表
  // TODO 学习下页面如何传值
  routes: <String, WidgetBuilder>{
    'app': (BuildContext context) => AppPage(),
    'chat': (BuildContext context) => ChatPage(),
    'msglist': (BuildContext context) => MessagePage()
  },
  home: LoadPage(),
));

//自定义主题 绿色小清新风格
final ThemeData mDefaultTheme = ThemeData(
  primaryColor: Colors.red,
  scaffoldBackgroundColor: Color(0xFFebebeb),
  cardColor: Colors.red,
);
