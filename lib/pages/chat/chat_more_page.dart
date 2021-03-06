import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/route/route.dart';
import 'package:flutter_qyyim/config/t.dart';
import 'package:flutter_qyyim/pages/chat/shoot_page.dart';
import 'package:flutter_qyyim/tool/log_utils.dart';

import 'handle/message_handle.dart';
import 'more_item_card.dart';

class ChatMorePage extends StatefulWidget {
  final int index;
  final String id;
  final int type;
  final double keyboardHeight;
  final Callback moreTap;

  ChatMorePage(
      {this.index = 0, this.id, this.type, this.keyboardHeight, this.moreTap});

  @override
  _ChatMorePageState createState() => _ChatMorePageState();
}

class _ChatMorePageState extends State<ChatMorePage> {
  List data = [
    {"name": "相册", "icon": "assets/images/chat/ic_details_photo.webp"},
    {"name": "拍摄", "icon": "assets/images/chat/ic_details_camera.webp"},
    {"name": "视频", "icon": "assets/images/chat/ic_details_camera.webp"},
    {"name": "自定义视频", "icon": "assets/images/chat/ic_details_camera.webp"},
    {"name": "地图", "icon": "assets/images/chat/ic_details_localtion.webp"},
    {"name": "文件", "icon": "assets/images/chat/ic_details_file.webp"},
  ];



  itemBuild(data) {
    return new Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.only(bottom: 20.0),
      child: new Wrap(
        runSpacing: 10.0,
        spacing: 10,
        children: List.generate(data.length, (index) {
          String name = data[index]['name'];
          String icon = data[index]['icon'];
          return new MoreItemCard(
            name: name,
            icon: icon,
            keyboardHeight: widget.keyboardHeight,
            onPressed: () {
              if (widget.moreTap != null) {
                widget.moreTap(name);
              }
            },
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /*if (widget.index == 0) {
      return itemBuild(data);
    } else {
      return itemBuild(dataS);
    }*/

    return itemBuild(data);
  }
}
