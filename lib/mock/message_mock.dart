//组装数据
import 'dart:core';
import 'dart:core';

import 'package:flutter_qyyim/pages/message/message.dart';

Future<List<Message>> getMessageData() async {
  List<Message> messageData = [
    Message(
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544070910437&di=86ffd13f433c252d4c49afe822e87462&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fw%3D580%2Fsign%3Debf3e26b1a4c510faec4e21250582528%2F0cf431adcbef76092781a53c2edda3cc7dd99e8e.jpg',
        'bingley',
        '突然想到的',
        DateTime.now(),
        MessageType.CHAT),
    Message(
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540403360209&di=ec25c22642ec5e3858dc70a393ca0697&imgtype=0&src=http%3A%2F%2Fphotocdn.sohu.com%2F20110901%2FImg318072437.jpg',
        '聊天组',
        '……',
        DateTime.now(),
        MessageType.GROUP),
    Message(
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540403360209&di=ec25c22642ec5e3858dc70a393ca0697&imgtype=0&src=http%3A%2F%2Fphotocdn.sohu.com%2F20110901%2FImg318072437.jpg',
        'lisa',
        '我在思考问题。。',
        DateTime.now(),
        MessageType.CHAT)
  ];

  return messageData;
}
