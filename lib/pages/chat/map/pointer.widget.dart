import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/pages/chat/event/AnimEvent.dart';
import 'package:flutter_qyyim/pages/chat/event/MsgEvent.dart';
import 'package:flutter_qyyim/testdemo/cross_data/event_bus.dart';


const _iconSize = 50.0;

class Pointer extends StatefulWidget {
  const Pointer({
    Key key,
    @required this.pointer,
  }) : super(key: key);

  final Widget pointer;

  @override
  _PointerState createState() => _PointerState();
}

class _PointerState extends State<Pointer>
    with SingleTickerProviderStateMixin, AfterLayoutMixin {
  AnimationController _jumpController;
  Animation<Offset> _tween;
  StreamSubscription subscription;

  @override
  void initState() {
    super.initState();
    _jumpController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _tween = Tween(begin: Offset(0, 0), end: Offset(0, -15)).animate(
        CurvedAnimation(parent: _jumpController, curve: Curves.easeInOut));
  }

  @override
  void afterFirstLayout(BuildContext context) {
    /*final bloc = BLoCProvider.of<LocationPickerBLoC>(context);
    bloc.moveEnd.listen((_) {
      // 执行跳动动画
      _jumpController.forward().then((it) => _jumpController.reverse());
    });*/


    subscription = eventBus.on<AnimEvent>().listen((event) {
      // 执行跳动动画
      _jumpController.forward().then((it) => _jumpController.reverse());
    });
  }

  @override
  void dispose() {
    subscription.cancel(); //State 销毁时，清理注册
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _tween,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(
              _tween.value.dx,
              _tween.value.dy - _iconSize / 2,
            ),
            child: child,
          );
        },
        child: widget.pointer ?? gDefaultPointer,
      ),
    );
  }
}
final gDefaultPointer = Image.asset(
  'assets/images/wechat_locate.png',
);