import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_qyyim/common/db/solution1/db_utils.dart';
import 'package:flutter_qyyim/common/provider/view_state_refresh_list_model.dart';
import 'package:flutter_qyyim/mock/chat_mock.dart';
import 'package:flutter_qyyim/pages/chat/event/MsgEvent.dart';
import 'package:flutter_qyyim/pages/chat/model/chat_data.dart';
import 'package:flutter_qyyim/tool/date_util.dart';

class ChatViewModel extends ViewStateRefreshListModel<ChatData> {

  bool isBottom = false;

  String chatId;
  ChatViewModel(this.chatId);

  /// 初始化聊天数据
  @override
  Future<List<ChatData>> loadData({int pageNum}) async {
    //debugPrint('查询到的结果数量**************${queryItemsLimit.length}---$currentPageNum');
    isBottom = false;
    //await Future.delayed(Duration(seconds: 1));
    return DbUtils.getInstance().queryItemsLimit(ChatData(),limit: pageSize,offset: (currentPageNum - 1) * pageSize,orderBy: "id Desc",key:"chatId",value: chatId);
  }

  /// 发送消息
  void sendMgs(MsgEvent event) {
    MsgType msgType = event.type;
    String content = event.content;

    String sqljson = "";
    var mapPic;
    if (msgType == MsgType.VIDEO) {
      sqljson = '{"videosrc": "$content","urls": "$content","type": "Video","path": "$content"}';
    } else if (msgType == MsgType.IMG) {
      sqljson = '{"imageList": "$content","type": "Image"}';
    } else if (msgType == MsgType.VOICE) {
      var recordTime = event.recordTime;
      sqljson = '{"soundUrls": "$content","urls": "$content","recordTime":"$recordTime","type": "Sound","path": "$content"}';
    } else if (msgType == MsgType.TXT) {
      sqljson = '{"text": "$content", "type": "Text"}';
    } else if (msgType == MsgType.MAP) {
      sqljson = '{"text": "${event.latLng.toString()}", "type": "Map"}';

       mapPic = event.mapPic;
    }

    var currentStamp = DateUtil.getNowDateMs();
    // 模拟存到服务器中，数据库插入
    var chatData = ChatData(msg: sqljson, id: '$currentStamp', nickName: 'bingley',time: currentStamp,chatId: chatId,mapPic: mapPic);
    list.insert(0,chatData);
    DbUtils.getInstance().insertItem(chatData);


    // 再更新下会话消息


    isBottom = true;
    setIdle();


  }


/* DbUtils.getInstance().queryItems(Contact(),key: 'id',value: '${widget.id}');
if (contacts != null) {
      print("result=====》${contacts[0].name}");
    }*/
}
