import 'dart:math';

import 'package:flutter_qyyim/common/db/solution1/db_utils.dart';
import 'package:flutter_qyyim/common/provider/view_state_refresh_list_model.dart';
import 'package:flutter_qyyim/mock/chat_mock.dart';
import 'package:flutter_qyyim/pages/chat/event/MsgEvent.dart';
import 'package:flutter_qyyim/pages/chat/model/chat_data.dart';

class ChatViewModel extends ViewStateRefreshListModel<ChatData> {
  /// 初始化聊天数据
  @override
  Future<List<ChatData>> loadData({int pageNum}) {
    //var queryItems = DbUtils.getInstance().queryItems(ChatData());

    return getChatData();
  }

  /// 发送消息
  void sendMgs(MsgEvent event) {
    MsgType msgType = event.type;
    String content = event.content;
    if (msgType == MsgType.VIDEO) {
      _handleSubmittedVideoData(content);
    } else if (msgType == MsgType.IMG) {
      _handleSubmittedImgData(content);
    } else if (msgType == MsgType.VOICE) {
      print("声音的路径${event.content}");
      _handleSubmittedVoiceData(event.content);
    } else if (msgType == MsgType.TXT) {
      _handleSubmittedData(content);
    }
    setIdle();
  }

  _handleSubmittedData(String text) async {
    String textjson = '{"text": "$text", "type": "Text"}';
    list.add(ChatData(msg: textjson));
    // 数据库插入
    DbUtils.getInstance()
        .insertItem(ChatData(msg: textjson, id: '112', nickName: 'bingley'));
  }

  _handleSubmittedImgData(String text) async {
    String imgJson = '{"imageList": "$text","type": "Image"}';

    list.add(new ChatData(msg: imgJson));
  }

  _handleSubmittedVideoData(String text) async {
    String videoJson = '{"videosrc": "$text","urls": "$text","type": "Video","path": "$text"}';

    // String videoJson = "{"videosrc":"[$text]",'urls':"[$text]","type": "Video","path": $text}";
    list.add(new ChatData(msg: videoJson));
  }

  _handleSubmittedVoiceData(String text) async {
    String videoJson = '{"soundUrls": "$text","urls": "$text","type": "Sound","path": "$text"}';

    list.add(
        new ChatData(msg: videoJson));
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
