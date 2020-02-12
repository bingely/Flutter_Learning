import 'package:flutter/material.dart';
import 'package:flutter_qyyim/provider/global_model.dart';
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

  ///全局
  ChangeNotifierProvider<GlobalModel> getGlobal(Widget child) {
    return ChangeNotifierProvider<GlobalModel>(
      builder: (context) => GlobalModel(),
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
