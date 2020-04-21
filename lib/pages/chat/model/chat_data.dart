import 'dart:typed_data';

import 'package:flutter_qyyim/common/db/solution1/db_base_bean.dart';

class ChatData extends DbBaseBean {
  /// 消息内容
  final String msg;
  /// 消息id
  final String id;
  /// 消息时间
  final int time;
  /// 用户昵称
  final String nickName;
  /// 用户头像
  final String avatar;
  /// 会话id
  final String chatId;
  /// 地图pic
  Uint8List mapPic;


  ChatData({this.msg, this.id, this.time, this.nickName, this.avatar, this.chatId, this.mapPic});

  @override
  String getTableName() {
    return "MessageData";
  }

  @override
  DbBaseBean fromJson(Map<String, dynamic> map) {
    return new ChatData(
      msg: map['msg'] as String,
      id: map['id'] as String,
      time: map['time'] as int,
      nickName: map['nickName'] as String,
      avatar: map['avatar'] as String,
      chatId: map['chatId'] as String,
      mapPic: map['mapPic'] as Uint8List
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'msg': this.msg,
      'id': this.id,
      'time': this.time,
      'nickName': this.nickName,
      'avatar': this.avatar,
      'chatId': this.chatId,
      'mapPic': this.mapPic
    };
  }
}
