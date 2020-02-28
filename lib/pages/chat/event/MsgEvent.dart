

class MsgEvent {
  String content;
  MsgType type;

  MsgEvent({this.content, this.type});

}

enum MsgType{
  IMG,VIDEO,VOICE
}