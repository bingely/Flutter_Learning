import 'package:flutter/material.dart';
import 'package:flutter_qyyim/ui/toast.dart';

/// 目前基于dart写的toastview
class ToastUtils {
  static void show(String msg, BuildContext context,
      {int type = NORMAL,
      int duration = 1,
      int gravity = CENTER,
      Color backgroundColor = const Color(0xAA000000),
      Color textColor = Colors.white,
      double backgroundRadius = 5.0}) {
    Toast.show(msg, context,type: type);
  }
}
