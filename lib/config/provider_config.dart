import 'package:flutter/material.dart';
import 'package:flutter_qyyim/provider/global_model.dart';
import 'package:flutter_qyyim/testdemo/wann/view_model/login_model.dart';
import 'package:provider/provider.dart';

/// ProviderConfig  provider配置
class ProviderConfig {
  static ProviderConfig _instance;

  static ProviderConfig getInstance() {
    if (_instance == null) {
      _instance = ProviderConfig._internal();
    }
    return _instance;
  }

  ///全局   由于封装的数据资源不仅需要为子 Widget 提供读的能力，还要提供写的能力，因此我们需要使用 Provider 的升级版 ChangeNotifierProvider
  ChangeNotifierProvider<GlobalModel> getGlobal(Widget child) {
    return ChangeNotifierProvider<GlobalModel>(
      builder: (context) => GlobalModel(),
      child: child,
    );
  }

  /// 多状态的资源封装
  MultiProvider getMultiGlobal(Widget child) {
    return MultiProvider(
      providers: [
        Provider.value(value: 30.0),
        ChangeNotifierProvider.value(value: GlobalModel()),
        ChangeNotifierProvider.value(value: LoginModel())
      ],
      child: child,
    );
  }

  ///登陆页面
  /*ChangeNotifierProvider<LoginModel> getLoginPage(Widget child) {
    return ChangeNotifierProvider<LoginModel>(
      builder: (context) => LoginModel(),
      child: child,
    );
  }*/

  ProviderConfig._internal();
}
