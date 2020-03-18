

class MsgEvent {
  String content;
  MsgType type;

  MsgEvent({this.content, this.type});

}

enum MsgType{
  TXT,IMG,VIDEO,VOICE
}