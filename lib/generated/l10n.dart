// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S(this.localeName);
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S(localeName);
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  final String localeName;

  String get appName {
    return Intl.message(
      'qyyIm',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  String get actionConfirm {
    return Intl.message(
      '确认',
      name: 'actionConfirm',
      desc: '',
      args: [],
    );
  }

  String get actionCancel {
    return Intl.message(
      '取消',
      name: 'actionCancel',
      desc: '',
      args: [],
    );
  }

  String get viewStateMessageError {
    return Intl.message(
      '加载失败',
      name: 'viewStateMessageError',
      desc: '',
      args: [],
    );
  }

  String get viewStateMessageNetworkError {
    return Intl.message(
      '网络连接异常,请检查网络或稍后重试',
      name: 'viewStateMessageNetworkError',
      desc: '',
      args: [],
    );
  }

  String get viewStateMessageEmpty {
    return Intl.message(
      '空空如也',
      name: 'viewStateMessageEmpty',
      desc: '',
      args: [],
    );
  }

  String get viewStateMessageUnAuth {
    return Intl.message(
      '未登录',
      name: 'viewStateMessageUnAuth',
      desc: '',
      args: [],
    );
  }

  String get viewStateButtonRefresh {
    return Intl.message(
      '刷新一下',
      name: 'viewStateButtonRefresh',
      desc: '',
      args: [],
    );
  }

  String get viewStateButtonRetry {
    return Intl.message(
      '重试',
      name: 'viewStateButtonRetry',
      desc: '',
      args: [],
    );
  }

  String get viewStateButtonLogin {
    return Intl.message(
      '登录',
      name: 'viewStateButtonLogin',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale('en', ''), Locale('zh', ''),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}