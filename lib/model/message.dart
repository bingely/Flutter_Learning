//消息类型枚举类型
import 'package:flutter_qyyim/common/db/solution1/db_base_bean.dart';

enum MessageType { SYSTEM, PUBLIC, CHAT, GROUP }

class DisturbMode {
  static const int CLOSE = 0;
  static const int OPEN = 1;
}

//聊天会话数据
class SessionMsg extends DbBaseBean {
  String id;

  //头像
  String avatars;

  //主标题
  String title;

  //子标题
  String subTitle;

  //消息时间
  int time;

  //消息类型
  int type;

  String userId; // 也是会话id,每个用户都对应一个会话

  // 是否是免打扰模式
  int isDisturbMode;
  // 是否是置顶聊天
  int isTopChat;
  /*// 是否是强提醒
  is*/

  SessionMsg(
      {this.id,
      this.avatars,
      this.title,
      this.subTitle,
      this.time,
      this.type,
      this.userId,
      this.isDisturbMode,
      this.isTopChat});

  @override
  DbBaseBean fromJson(Map<String, dynamic> map) {
    return new SessionMsg(
      id: map['id'] as String,
      avatars: map['avatars'] as String,
      title: map['title'] as String,
      subTitle: map['subTitle'] as String,
      time: map['time'] as int,
      type: map['type'] as int,
      userId: map['userId'] as String,
      isDisturbMode: map['isDisturbMode'] as int,
      isTopChat: map['isTopChat'] as int
    );
  }

  @override
  String getTableName() {
    return "SessionMsg";
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'avatars': this.avatars,
      'title': this.title,
      'subTitle': this.subTitle,
      'time': this.time,
      'type': this.type,
      'userId': this.userId,
      'isDisturbMode': this.isDisturbMode,
      'isTopChat': this.isTopChat
    };
  }
}
