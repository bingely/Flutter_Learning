import 'package:flutter/material.dart';
import 'package:flutter_qyyim/message/message_data.dart';
import 'package:flutter_qyyim/message/message_item.dart';

class MessagePage extends StatefulWidget {
  @override
  MessagePageState createState() {
    return MessagePageState();
  }
}

class MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
