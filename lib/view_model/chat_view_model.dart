import 'package:flutter_qyyim/common/provider/view_state_model.dart';
import 'package:flutter_qyyim/pages/chat/event/MsgEvent.dart';
import 'package:flutter_qyyim/pages/chat/model/chat_data.dart';

class ChatViewModel extends ViewStateModel {
  List<ChatData> chatData = [];


  /// 初始化聊天数据
  iniChatData() {}


  /// 发送消息
  void sendMgs(MsgEvent event) {
    MsgType msgType = event.type;
    String content = event.content;
    if (msgType == MsgType.VIDEO) {
      _handleSubmittedVideoData(content);
    } else if (msgType == MsgType.IMG) {
      _handleSubmittedImgData(content);
    } else if (msgType == MsgType.VOICE){
      print("声音的路径${event.content}");
      _handleSubmittedVoiceData(event.content);
    } else if (msgType == MsgType.TXT) {
      _handleSubmittedData(content);
    }
    setIdle();
  }

  _handleSubmittedData(String text) async {
    chatData.insert(0, new ChatData(msg: {"text": text, "type": "Text"}));
  }
  _handleSubmittedImgData(String text) async {
    chatData.insert(
        0,
        new ChatData(msg: {
          "imageList": [text],
          "type": "Image"
        }));
  }

  _handleSubmittedVideoData(String text) async {
    chatData.insert(
        0,
        new ChatData(msg: {
          "videosrc": [text],
          'urls': [text],
          "type": "Video",
          "path": text
        }));
  }

  _handleSubmittedVoiceData(String text) async {
    chatData.insert(
        0,
        new ChatData(msg: {
          "soundUrls": [text],
          'urls': [text],
          "type": "Sound",
          "path": text
        }));
  }
  /*Future getChatMsgData() async {
    final str = await ChatDataRep().repData(widget.id, widget.type);
    List<ChatData> listChat = str;
    chatData.clear();
    chatData..addAll(listChat.reversed);

    // 异步函数setState()导致内存泄漏的错误。
    if (mounted) setState(() {});
  }*/
}
