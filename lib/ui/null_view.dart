import 'package:flutter/material.dart';
import 'package:flutter_qyyim/config/app.dart';


class HomeNullView extends StatelessWidget {
  final String str;

  HomeNullView({this.str = '无会话消息'});

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new InkWell(
        child: new Text(
          str ?? '',
          style: TextStyle(color: AppColors.mainTextColor),
        ),
        onTap: () {
          ///routePush(new UserPage()),
          ///}
        }
    ),
    );
    }
}
