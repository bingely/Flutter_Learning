import 'package:flutter/material.dart';
import 'package:flutter_qyyim/ui/image_view.dart';

/// 属于容器类的style
/// padding margin 忽略
class AppBoxStyle {
  ///****************BoxDecoration  Android里面的shape很相似 ********************
  /// //Container 的 color 和 decoration 不能同时设置
  static const boxDecor = BoxDecoration(
    //背景装饰
    gradient: RadialGradient(
        //背景径向渐变
        colors: [Colors.red, Colors.orange],
        center: Alignment.topLeft,
        radius: .98),
    boxShadow: [
      //卡片阴影
      BoxShadow(
          color: Colors.black54, offset: Offset(2.0, 2.0), blurRadius: 4.0)
    ],
    // 弧度  表示和Edgeinset一样同样有四种方法
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    // 形状 circle  rectangle
    shape: BoxShape.circle,
    color: Color(0xffEDEDED),
  );

  // example 倒计时按钮
  static const box_cutdown = BoxDecoration(
      color: Color(0xffEDEDED),
      borderRadius: const BorderRadius.all(Radius.circular(10.0)));

  // eg2 搜索栏背景 AppBar渐变遮罩背景
  static const boxSearchBg = LinearGradient(
    colors: [Color(0x66000000), Colors.transparent],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static var box = BoxDecoration(
    color: Color.fromARGB((1 * 255).toInt(), 255, 255, 255),
  );

  // 圆角矩形
  static var shape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0));

  /// **************Matrix********
  static var tranform = new Matrix4.skewY(0.3); //沿Y轴倾斜0.3弧度
}
