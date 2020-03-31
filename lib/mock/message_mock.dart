//组装数据
import 'dart:core';
import 'dart:core';

import 'package:flutter_qyyim/model/message.dart';

Future<List<SessionMsg>> getMessageData() async {
  List<SessionMsg> messageData = [
    SessionMsg(
        userId: '11112',
        avatar:'https://randomuser.me/api/portraits/men/11.jpg',
        title:'汤姆丁',
        subTitle:'……',
        time:DateTime.now(),
        type:MessageType.GROUP),
    SessionMsg(
        userId: '11111',
        avatar:'https://randomuser.me/api/portraits/men/10.jpg',
        title:'bingley',
        subTitle:'突然想到的',
        time:DateTime(2019, 6, 20, 17, 30,20),
        type:MessageType.CHAT),
    SessionMsg(
        userId: '11113',
        avatar:'https://randomuser.me/api/portraits/women/10.jpg',
        title:'lisa',
        subTitle:'我在思考问题。。',
        time:DateTime(2020, 3, 20, 17, 30,20),
        type:MessageType.CHAT)
  ];

  return messageData;
}
