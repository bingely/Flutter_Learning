import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'common/route/route.dart';
import 'config/const.dart';
import 'config/provider_config.dart';
import 'config/router_manger.dart';
import 'config/storage_manager.dart';
import 'generated/l10n.dart';
import 'common/provider/global_model.dart';

/// 应用入口处
Future<void> main() async {
  /// 确保初始化
  WidgetsFlutterBinding.ensureInitialized();

  /// 配置初始化
  await StorageManager.init();
  /// Provider如果与Listenable/一起使用，现在抛出Stream。考虑使用ListenableProvider/ StreamProvider代替。或者，可以通过设置Provider.debugCheckInvalidValueType 为null这样来禁用此异常***/
 // Provider.debugCheckInvalidValueType = null;

  /// APP入口并配置Provider
  runApp(ProviderConfig.getInstance().getMultiGlobal(App()));

  /// Android状态栏透明
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalModel>(
      builder: (context,model,child){
        return RefreshConfiguration(
            hideFooterWhenNotFull: true, //列表数据不满一页,不触发加载更多
            child: new MaterialApp(
              navigatorKey: navGK,
              title: model.appName,
              /// 主题
              theme: ThemeData(
                scaffoldBackgroundColor: bgColor,
                //hintColor: Colors.grey.withOpacity(0.3),
                //splashColor: Colors.transparent,
                //canvasColor: Colors.transparent,
              ),
              /// 国际化配置
              locale: model.currentLocale,
              localizationsDelegates: const [
                S.delegate,
                RefreshLocalizations.delegate, //下拉刷新
                GlobalCupertinoLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              /// 路由管理注入
              onGenerateRoute: Router.generateRoute,
              initialRoute: RouteName.splash,//RouterTestRoute
            ));
      },
    );
  }
}
