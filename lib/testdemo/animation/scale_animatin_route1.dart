import 'package:flutter/material.dart';

import 'animated_image.dart';

// 第二个版本
class ScaleAnimationRoute1 extends StatefulWidget {
  @override
  _ScaleAnimationRoute1State createState() => new _ScaleAnimationRoute1State();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _ScaleAnimationRoute1State extends State<ScaleAnimationRoute1>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        new AnimationController(duration: Duration(seconds: 1), vsync: this);
    //使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);

    // 动画状态监听
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });

    //启动动画(正向执行)
    controller.forward();
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 下面一个没动画(那是因为少了Center)

    //return AnimatedImage(animation: animation);
    /* return AnimatedBuilder(
      animation: animation,
      child: Image.asset("images/contact_list_normal.png"),
      builder: (BuildContext ctx, Widget child) {
        return Container(
          height: animation.value,
          width: animation.value,
          child: child,
        );
      },
    );*/

    return AnimatedBuilder(
      animation: animation,
      child: Image.asset("images/contact_list_normal.png"),
      builder: (BuildContext ctx, Widget child) {
        return new Center(
          child: Container(
            height: animation.value,
            width: animation.value,
            child: child,
          ),
        );
      },
    );
  }
}
