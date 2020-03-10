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
import 'package:flutter_qyyim/testdemo/animation/hero/hero_animation_route.dart';
import 'package:flutter_qyyim/testdemo/animation/rout_animation/rout_animated_page.dart';
import 'package:flutter_qyyim/testdemo/animation/scale_animatin_route.dart';
import 'package:flutter_qyyim/testdemo/animation/scale_animatin_route1.dart';
import 'package:flutter_qyyim/testdemo/animation/stagger/stagger_route.dart';
import 'package:flutter_qyyim/testdemo/basic_component_chapter3/indicator.dart';
import 'package:flutter_qyyim/testdemo/container_class_chapter5/clip_test_route.dart';
import 'package:flutter_qyyim/testdemo/container_class_chapter5/limit_container_page.dart';
import 'package:flutter_qyyim/testdemo/container_class_chapter5/scaffold_page.dart';
import 'package:flutter_qyyim/testdemo/container_class_chapter5/transform_page.dart';
import 'package:flutter_qyyim/testdemo/dio_page.dart';
import 'package:flutter_qyyim/testdemo/file_data_page.dart';
import 'package:flutter_qyyim/testdemo/layout_chpter4/align_layout_page.dart';
import 'package:flutter_qyyim/testdemo/sliver_page.dart';
import 'package:flutter_qyyim/testdemo/wann/user/login_page.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'common/websocket/ws_page.dart';
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
          home: WsPage(), //RouterTestRoute
        ));
  }
}
