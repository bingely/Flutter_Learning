//消息类型枚举类型
enum MessageType { SYSTEM,PUBLIC,CHAT,GROUP }

//聊天会话数据
class SessionMsg{
  //头像
  String avatar;
  //主标题
  String title;
  //子标题
  String subTitle;
  //消息时间
  DateTime time;
  //消息类型
  MessageType type;

  String userId;// 也是会话id,每个用户都对应一个会话

  SessionMsg({this.avatar,this.title,this.subTitle,this.time,this.type,this.userId});
}

