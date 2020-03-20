import 'dart:math';

import 'package:flutter_qyyim/common/db/solution1/db_utils.dart';
import 'package:flutter_qyyim/common/provider/view_state_refresh_list_model.dart';
import 'package:flutter_qyyim/mock/chat_mock.dart';
import 'package:flutter_qyyim/pages/chat/event/MsgEvent.dart';
import 'package:flutter_qyyim/pages/chat/model/chat_data.dart';
import 'package:flutter_qyyim/tool/date_utils.dart';

class ChatViewModel extends ViewStateRefreshListModel<ChatData> {

  /// 初始化聊天数据
  @override
  Future<List<ChatData>> loadData({int pageNum}) {
    //
    return DbUtils.getInstance().queryItems(ChatData());
  }

  /// 发送消息
  void sendMgs(MsgEvent event) {
    MsgType msgType = event.type;
    String content = event.content;

    String sqljson = "";
    if (msgType == MsgType.VIDEO) {
      sqljson = '{"videosrc": "$content","urls": "$content","type": "Video","path": "$content"}';
    } else if (msgType == MsgType.IMG) {
      sqljson = '{"imageList": "$content","type": "Image"}';
    } else if (msgType == MsgType.VOICE) {
      sqljson = '{"soundUrls": "$content","urls": "$content","type": "Sound","path": "$content"}';
    } else if (msgType == MsgType.TXT) {
      sqljson = '{"text": "$content", "type": "Text"}';
    }

    var currentStamp = DateUtils.getCurrentStamp();
    // 模拟存到服务器中，数据库插入
    var chatData = ChatData(msg: sqljson, id: '$currentStamp', nickName: 'bingley');
    list.add(chatData);
    DbUtils.getInstance().insertItem(chatData);

    setIdle();
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
