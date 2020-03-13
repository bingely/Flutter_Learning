import 'package:flutter/material.dart';
import 'package:flutter_qyyim/config/resource_mananger.dart';

// logo
class LoginLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      child: Image.asset(
        ImageHelper.wrapAssets('icon_me_friends'),
        width: 130,
        height: 100,
        fit: BoxFit.fitWidth,
        color: Colors.white,
        colorBlendMode: BlendMode.srcIn,
      ),
    );
  }
}

// 白色背景
class LoginFormContainer extends StatelessWidget {
  Widget child;

  LoginFormContainer({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: ShapeDecoration(shape: RoundedRectangleBorder(), shadows: [
        BoxShadow(
          color: Theme.of(context).primaryColor.withAlpha(20),
          offset: Offset(1.0,1.0),
          blurRadius: 10.0,
          spreadRadius: 3.0
        )
      ]),
      child: child,
    );
  }
}
