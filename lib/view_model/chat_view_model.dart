import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_qyyim/common/db/solution1/db_utils.dart';
import 'package:flutter_qyyim/common/provider/view_state_refresh_list_model.dart';
import 'package:flutter_qyyim/mock/chat_mock.dart';
import 'package:flutter_qyyim/model/message.dart';
import 'package:flutter_qyyim/pages/chat/event/MsgEvent.dart';
import 'package:flutter_qyyim/pages/chat/model/chat_data.dart';
import 'package:flutter_qyyim/pages/contacts/contacts.dart';
import 'package:flutter_qyyim/testdemo/cross_data/event_bus.dart';
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
    return DbUtils.getInstance().queryItemsLimit(ChatData(),
        limit: pageSize,
        offset: (currentPageNum - 1) * pageSize,
        orderBy: "id Desc",
        key: "chatId",
        value: chatId);
  }

  /// 发送消息
  Future<void> sendMgs(MsgEvent event) async {
    MsgType msgType = event.type;
    String content = event.content;

    String sqljson = "";

    String subTitle = "";
    var mapPic;
    if (msgType == MsgType.VIDEO) {
      sqljson =
          '{"videosrc": "$content","urls": "$content","type": "Video","path": "$content"}';
      subTitle = "视频消息";
    } else if (msgType == MsgType.IMG) {
      sqljson = '{"imageList": "$content","type": "Image"}';
      subTitle = "图片消息";
    } else if (msgType == MsgType.VOICE) {
      var recordTime = event.recordTime;
      sqljson =
          '{"soundUrls": "$content","urls": "$content","recordTime":"$recordTime","type": "Sound","path": "$content"}';
      subTitle = "语音消息";
    } else if (msgType == MsgType.TXT) {
      sqljson = '{"text": "$content", "type": "Text"}';
      subTitle = "$content";
    } else if (msgType == MsgType.MAP) {
      sqljson =
          '{"text": "${event.place.title}","address":"${event.place.address}","latitude":"${event.place.latLng.latitude}","lotitude":"${event.place.latLng.longitude}","type": "Map"}';
      mapPic = event.mapPic;
      subTitle = "地图消息";
    } else if (msgType == MsgType.FILE) {
      sqljson =
          '{"text": "$content","filesize":"${event.fileSize}", "type": "File"}';
      subTitle = "文件消息";
    }

    var currentStamp = DateUtil.getNowDateMs();
    // 模拟存到服务器中，数据库插入
    var chatData = ChatData(
        msg: sqljson,
        id: '$currentStamp',
        nickName: 'bingley',
        time: currentStamp,
        chatId: chatId,
        mapPic: mapPic);
    list.insert(0, chatData);
    DbUtils.getInstance().insertItem(chatData);

    // 再更新下会话消息
    List<Contact> contacts = await DbUtils.getInstance()
        .queryItems(Contact(), key: "id", value: chatId);
    var contact = contacts[0];
    var sesionMsg = SessionMsg(
        id: chatId,
        userId: chatId,
        time: DateTime.now().millisecondsSinceEpoch,
        title: contact.name,
        avatars: contact.avatar,
        subTitle: subTitle,
        type: MessageType.CHAT.index);
    DbUtils.getInstance().insertItem(sesionMsg);

    //eventBus.fire(event)

    isBottom = true;
    setIdle();
  }

/* DbUtils.getInstance().queryItems(Contact(),key: 'id',value: '${widget.id}');
if (contacts != null) {
      print("result=====》${contacts[0].name}");
    }*/
}
