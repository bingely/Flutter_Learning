import 'package:flutter/material.dart';


/// 就是类似于java接口回调
class Functions {}



typedef OnChangedCallback = Future<void> Function(); //输入内容变化时触发

typedef OnItemClick = Future<void> Function(Object); //控件点击时触发

typedef OnItemDoubleClick = Future<void> Function(Object); //控件点击时触发

typedef OnItemLongClick = Future<void> Function(Object); //控件点击时触发

typedef OnCallBack = Future<void> Function(Object);

typedef OnCallBackWithType = Future<void> Function(int, Object);

/*typedef OnUpdateCallback = Future<void> Function(
    Object, int, MessageEntity); //数据更新时触发
typedef BackPressCallback = Future<void> Function(BackPressType); //按返回键时触发
typedef OnSubmitCallback = Future<void> Function(
    Object, Operation, BuildContext); //输入完成时触发
 */