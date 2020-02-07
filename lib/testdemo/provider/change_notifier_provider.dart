import 'dart:core' as prefix0;
import 'dart:core';

import 'package:flutter/material.dart';

// 该方法用于在Dart中获取模板类型
Type _typeof<T>() => T;

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {

  final Widget child;
  final T data;

  const ChangeNotifierProvider({Key key, this.data, this.child}) : super(key: key);

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static T of<T>(BuildContext context){

  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}
