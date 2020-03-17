//组装数据
import 'dart:core';
import 'dart:core';

import 'package:flutter_qyyim/pages/message/message.dart';

Future<List<Message>> getMessageData() async {
  List<Message> messageData = [
    Message(
        'https://randomuser.me/api/portraits/men/10.jpg',
        'bingley',
        '突然想到的',
        DateTime(2019, 6, 20, 17, 30,20),
        MessageType.CHAT),
    Message(
        'https://randomuser.me/api/portraits/men/11.jpg',
        '汤姆丁',
        '……',
        DateTime.now(),
        MessageType.GROUP),
    Message(
        'https://randomuser.me/api/portraits/women/10.jpg',
        'lisa',
        '我在思考问题。。',
        DateTime(2020, 6, 20, 17, 30,20),
        MessageType.CHAT)
  ];

  return messageData;
}
