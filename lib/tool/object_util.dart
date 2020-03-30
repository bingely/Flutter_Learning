import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';


class ObjectUtil {
  /// 判断obj 是否为空
  static bool isNotEmpty(Object object) {
    return !isEmpty(object);
  }

  static bool isEmpty(Object object) {
    if (object == null) return true;
    if (object is String && object.isEmpty) {
      return true;
    } else if (object is List && object.isEmpty) {
      return true;
    } else if (object is Map && object.isEmpty) {
      return true;
    }
    return false;
  }


  /// 快速点击判断
  static var clickTime = 0;

  static bool isFastClick(){
    var current = new DateTime.now().millisecondsSinceEpoch;
    if(current - clickTime > 1500){
      clickTime = current;
      return false;
    }
    clickTime = current;
    return true;
  }
}
