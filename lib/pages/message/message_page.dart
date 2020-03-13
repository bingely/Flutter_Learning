import 'package:flutter/material.dart';
import 'package:flutter_qyyim/tool/check.dart';
import 'package:flutter_qyyim/tool/win_media.dart';
import 'package:flutter_qyyim/pages/message/message_data.dart';
import 'package:flutter_qyyim/pages/message/message_item.dart';
import 'package:flutter_qyyim/ui/pop/w_popup_menu.dart';

class MessagePage extends StatefulWidget {
  @override
  MessagePageState createState() {
    return MessagePageState();
  }
}

class MessagePageState extends State<MessagePage> {
  final List actions = [
    {"title": '发起群聊', 'icon': 'assets/images/contacts_add_newmessage.png'},
    {"title": '添加朋友', 'icon': 'assets/images/ic_add_friend.webp'},
    {"title": '扫一扫', 'icon': ''},
    {"title": '收付款', 'icon': ''},
    {"title": '帮助与反馈', 'icon': ''},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("消息"),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              //跳转至搜索页面
              Navigator.pushNamed(context, 'search');
            },
            child: Icon(
              //搜索图标
              Icons.search,
            ),
          ),
          new WPopupMenu(
            menuWidth: winWidth(context) / 2.5,
            alignment: Alignment.center,
            onValueChanged: (String value) {
              if (!strNoEmpty(value)) return;
              // actionsHandle(value);
            },
            actions: actions,
            child: new Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              child: new Image.asset('assets/images/add_addressicon.png',
                  color: Colors.white, width: 22.0, fit: BoxFit.fitWidth),
            ),
          )
        ],
      ),
      //构造列表
      body: ListView.builder(
        //传入数据长度
          itemCount: messageData.length,
          //构造列表项
          itemBuilder: (BuildContext context, int index){
            //传入messageData返回列表项
            return MessageItem(messageData[index]);
          }
      ),
    );
  }
}
