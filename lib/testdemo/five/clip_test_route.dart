import 'package:flutter/material.dart';

/// 剪裁（Clip
class ClipTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Image avatar = Image.asset(
      "images/contact_list_normal.png",
      width: 60.0,
    );
    return Center(
      child: Column(
        children: <Widget>[
          avatar,
          ClipOval(
            child: avatar,
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: avatar,
          ),

        ],
      ),
    );
  }
}
