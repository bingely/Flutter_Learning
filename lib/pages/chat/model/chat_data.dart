import 'package:flutter/material.dart';

class ChatData {
  final Map msg;
  final String id;
  final int time;
  final String nickName;
  final String avatar;

  ChatData({
    @required this.msg,
    this.avatar,
    this.time,
    this.nickName,
    this.id,
  });
}

class ChatDataRep {
  repData(String id, int type) async {
    List<ChatData> chatData = new List<ChatData>();
    return chatData;
  }
}