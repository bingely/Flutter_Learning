import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_qyyim/pages/chat/camarademo/camera_screen.dart';
import 'package:flutter_qyyim/pages/chat/camarademo/gallery.dart';
import 'package:flutter_qyyim/pages/chat/chat_page.dart';
import 'package:flutter_qyyim/pages/chat/video/video_page.dart';
import 'package:flutter_qyyim/pages/message/message_page.dart';
import 'package:flutter_qyyim/pages/search/search.dart';
import 'package:flutter_qyyim/provider/global_model.dart';
import 'package:flutter_qyyim/testdemo/dio_page.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'pages/root_page.dart';
import 'common/route.dart';
import 'config/const.dart';
import 'pages/load_page.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<GlobalModel>(context)..setContext(context);

    return RefreshConfiguration(
        hideFooterWhenNotFull: true, //列表数据不满一页,不触发加载更多
        child: new MaterialApp(
          navigatorKey: navGK,
          title: model.appName,
          theme: ThemeData(
            scaffoldBackgroundColor: bgColor,
            //hintColor: Colors.grey.withOpacity(0.3),
            //splashColor: Colors.transparent,
            //canvasColor: Colors.transparent,
          ),
          debugShowCheckedModeBanner: false,
          locale: model.currentLocale,
          routes: <String, WidgetBuilder>{
            'app': (BuildContext context) => RootPage(),
            'chat': (BuildContext context) => ChatPage(),
            'msglist': (BuildContext context) => MessagePage(),
            'search': (BuildContext context) => SearchWidget(),
            'video_page': (BuildContext context) => VideoPage(),
            'gallay': (BuildContext context) => Gallery()
          },
          home: DioPage(), //RouterTestRoute
        ));
  }
}
