//消息类型枚举类型
enum MessageType { SYSTEM,PUBLIC,CHAT,GROUP }

//聊天数据
class MessageData{
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

  MessageData(this.avatar,this.title,this.subTitle,this.time,this.type);
}

//组装数据
List<MessageData> messageData = [
  MessageData('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544070910437&di=86ffd13f433c252d4c49afe822e87462&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fw%3D580%2Fsign%3Debf3e26b1a4c510faec4e21250582528%2F0cf431adcbef76092781a53c2edda3cc7dd99e8e.jpg',
      'bingley',
      '突然想到的',
      DateTime.now(),
      MessageType.CHAT
  ),
  MessageData(
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540403360209&di=ec25c22642ec5e3858dc70a393ca0697&imgtype=0&src=http%3A%2F%2Fphotocdn.sohu.com%2F20110901%2FImg318072437.jpg',
      '聊天组',
      '……',
      DateTime.now(),
      MessageType.GROUP
  ),
  MessageData(
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540403360209&di=ec25c22642ec5e3858dc70a393ca0697&imgtype=0&src=http%3A%2F%2Fphotocdn.sohu.com%2F20110901%2FImg318072437.jpg',
      'lisa',
      '我在思考问题。。',
      DateTime.now(),
      MessageType.CHAT
  )
];
