import 'package:flutter/material.dart';
import 'package:flutter_qyyim/chat/chat_page.dart';
import 'package:flutter_qyyim/message/message_page.dart';

void main() => runApp(MaterialApp(
  title: 'qyyim',
  theme: mDefaultTheme,
  // 路由表
  routes: <String, WidgetBuilder>{
    'chat': (BuildContext context) => ChatPage()
  },

  home: MessagePage(),
));

//自定义主题 绿色小清新风格
final ThemeData mDefaultTheme = ThemeData(
  primaryColor: Colors.red,
  scaffoldBackgroundColor: Color(0xFFebebeb),
  cardColor: Colors.red,
);
