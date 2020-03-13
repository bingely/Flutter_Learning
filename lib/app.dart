import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_qyyim/provider/global_model.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'config/router_manger.dart';
import 'common/route.dart';
import 'config/const.dart';

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
          // 路由管理注入
          onGenerateRoute: Router.generateRoute,
          initialRoute: RouteName.splash,//RouterTestRoute
        ));
  }
}
