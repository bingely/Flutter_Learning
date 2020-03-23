import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_qyyim/common/db/solution1/db_utils.dart';
import 'package:flutter_qyyim/common/provider/view_state_refresh_list_model.dart';
import 'package:flutter_qyyim/mock/chat_mock.dart';
import 'package:flutter_qyyim/pages/chat/event/MsgEvent.dart';
import 'package:flutter_qyyim/pages/chat/model/chat_data.dart';
import 'package:flutter_qyyim/tool/date_utils.dart';

class ChatViewModel extends ViewStateRefreshListModel<ChatData> {

  /// 初始化聊天数据
  @override
  Future<List<ChatData>> loadData({int pageNum}) async {
    //debugPrint('查询到的结果数量**************${queryItemsLimit.length}---$currentPageNum');
    List<ChatData> chatadatas = await DbUtils.getInstance().queryItemsLimit(ChatData(),limit: pageSize,offset: (currentPageNum - 1) * pageSize,orderBy: "id Desc");
    chatadatas.forEach((chatdata){
      debugPrint(DateUtils.stampToDateStr(int.parse(chatdata.id),
          format: DateUtils.fomateYYMMDDHHNNSS));
    });
    return DbUtils.getInstance().queryItemsLimit(ChatData(),limit: pageSize,offset: (currentPageNum - 1) * pageSize,orderBy: "id Desc");
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
    var chatData = ChatData(msg: sqljson, id: '$currentStamp', nickName: 'bingley',time: currentStamp);
    list.add(chatData);
    DbUtils.getInstance().insertItem(chatData);

    setIdle();
  }


/* DbUtils.getInstance().queryItems(Contact(),key: 'id',value: '${widget.id}');
if (contacts != null) {
      print("result=====》${contacts[0].name}");
    }*/
}
