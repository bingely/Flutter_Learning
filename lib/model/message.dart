//消息类型枚举类型
enum MessageType { SYSTEM,PUBLIC,CHAT,GROUP }

//聊天数据
class Message{
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

  Message(this.avatar,this.title,this.subTitle,this.time,this.type);
}

