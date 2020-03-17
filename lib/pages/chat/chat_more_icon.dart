import 'package:flutter/material.dart';
import 'package:flutter_qyyim/tool/check.dart';

import 'package:flutter_qyyim/ui/commom_button.dart';
import 'package:flutter_qyyim/config/const.dart';

class ChatMoreIcon extends StatelessWidget {
  final bool isMore;
  final String value;
  final VoidCallback onTap;
  final GestureTapCallback moreTap;

  ChatMoreIcon({
    this.isMore = false,
    this.value,
    this.onTap,
    this.moreTap,
  });

  @override
  Widget build(BuildContext context) {
    return strNoEmpty(value)
        ? new ComMomButton(
            text: '发送',
            style: TextStyle(color: Colors.white),
            width: 45.0,
            margin: EdgeInsets.all(10.0),
            radius: 4.0,
            onTap: onTap ?? () {},
          )
        : new InkWell(
            child: new Container(
              width: 23,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: new Image.asset(
                'assets/images/chat/ic_chat_more.webp',
                color: mainTextColor,
                fit: BoxFit.cover,
              ),
            ),
            onTap: () {
              if (moreTap != null) {
                moreTap();
              }
            },
          );
  }
}
