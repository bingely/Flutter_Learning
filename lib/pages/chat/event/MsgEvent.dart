

class MsgEvent {
  String content;
  MsgType type;
  String recordTime; // 录音/视频时长

  MsgEvent({this.content, this.type, this.recordTime});

}

enum MsgType{
  TXT,IMG,VIDEO,VOICE
}