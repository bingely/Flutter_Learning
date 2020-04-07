import 'dart:io';

import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_qyyim/config/app.dart';
import 'package:flutter_qyyim/tool/device_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'common/route/route.dart';
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
  /*await AmapService.init(
    iosKey: '4a5c00784c8a5b1660a702686cf57774',
    androidKey: 'a3294b588ecb07d341f5467368a41f9e',
  );*/
  // android 是在配置文件里面设置
  await AmapCore.init('4a5c00784c8a5b1660a702686cf57774');
  /// APP入口并配置Provider
  runApp(ProviderConfig.getInstance().getMultiGlobal(App()));

  /* 一行代码 全灰致敬
  runApp(ColorFiltered(
    colorFilter: ColorFilter.mode(Colors.white, BlendMode.color),
    child: ProviderConfig.getInstance().getMultiGlobal(App()),
  ));*/

  /// Android状态栏透明
  DeviceUtils.setBarStatus(true);



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
                scaffoldBackgroundColor: AppColors.bgColor,
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
              /// 是否显示debug标志
              debugShowCheckedModeBanner: false,
              /// 路由管理注入
              onGenerateRoute: Router.generateRoute,
              initialRoute: RouteName.app,//RouterTestRoute
            ));
      },
    );
  }
}
