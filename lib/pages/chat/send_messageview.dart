import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_qyyim/pages/chat/map/map_msg.dart';
import 'package:flutter_qyyim/tool/date_util.dart';
import 'package:flutter_qyyim/ui/message_view/Img_msg.dart';
import 'package:flutter_qyyim/ui/message_view/sound_msg.dart';
import 'package:flutter_qyyim/ui/message_view/text_msg.dart';
import 'package:flutter_qyyim/ui/message_view/video_msg.dart';

import 'model/chat_data.dart';

class SendMessageView extends StatefulWidget {
  final ChatData model;
  final ChatData nextModel;

  SendMessageView(this.model, this.nextModel);

  @override
  _SendMessageViewState createState() => _SendMessageViewState();
}

class _SendMessageViewState extends State<SendMessageView> {
  @override
  Widget build(BuildContext context) {
    //Map msg = widget.model.msg;

    if (widget.model == null) {
      return new Text('未知消息');
    }
    Map<String, dynamic> msg = json.decode(widget.model?.msg);

    bool _isShowTime = true;
    var showTime; //最终显示的时间
    if (null == widget.nextModel) {
      _isShowTime = true;
    } else {
      //如果当前消息的时间和上条消息的时间相差，大于3分钟，则要显示当前消息的时间，否则不显示
      if ((widget.model.time - widget.nextModel.time).abs() >
          3 * 60 * 1000) {
        _isShowTime = true;
      } else {
        _isShowTime = false;
      }
    }
    //获取当前的时间,yyyy-MM-dd HH:mm
    String nowTime = DateUtil.getDateStrByMs(
        new DateTime.now().millisecondsSinceEpoch,
        format: DateFormat.YEAR_MONTH_DAY_HOUR_MINUTE);
    //当前消息的时间,yyyy-MM-dd HH:mm
    String indexTime = DateUtil.getDateStrByMs(widget.model.time,
        format: DateFormat.YEAR_MONTH_DAY_HOUR_MINUTE);

    if (DateUtil.formatDateTime1(indexTime, DateFormat.YEAR) !=
        DateUtil.formatDateTime1(nowTime, DateFormat.YEAR)) {
      //对比年份,不同年份，直接显示yyyy-MM-dd HH:mm
      showTime = indexTime;
    } else if (DateUtil.formatDateTime1(indexTime, DateFormat.YEAR_MONTH) !=
        DateUtil.formatDateTime1(nowTime, DateFormat.YEAR_MONTH)) {
      //年份相同，对比年月,不同月或不同日，直接显示MM-dd HH:mm
      showTime =
          DateUtil.formatDateTime1(indexTime, DateFormat.MONTH_DAY_HOUR_MINUTE);
    } else if (DateUtil.formatDateTime1(indexTime, DateFormat.YEAR_MONTH_DAY) !=
        DateUtil.formatDateTime1(nowTime, DateFormat.YEAR_MONTH_DAY)) {
      //年份相同，对比年月,不同月或不同日，直接显示MM-dd HH:mm
      showTime =
          DateUtil.formatDateTime1(indexTime, DateFormat.MONTH_DAY_HOUR_MINUTE);
    } else {
      //否则HH:mm
      showTime = DateUtil.formatDateTime1(indexTime, DateFormat.HOUR_MINUTE);
    }


    return Column(
      children: <Widget>[
        _isShowTime
            ? Center(
                heightFactor: 2,
                child: Text(
                  showTime,
                  style: TextStyle(color: Color(0x50000000)),
                ))
            : SizedBox(height: 0),
        _chatItemWidget(msg)
      ],
    );
  }

  Widget _chatItemWidget(Map<String, dynamic> msg) {
    String msgStr = msg.toString();
    String msgType = msg['type'];
    bool isI = Platform.isIOS;
    bool iosText = isI && msgStr.contains('text:');
    bool iosImg = isI && msgStr.contains('imageList:');
    var iosS = msgStr.contains('downloadFlag:') && msgStr.contains('second:');
    bool iosSound = isI && iosS;

    if (msgType == "Text" || iosText) {
      return new TextMsg(msg['text'], widget.model);
    } else if (msgType == "Image" || iosImg) {
      return new ImgMsg(msg, widget.model);
    } else if (msgType == 'Sound' || iosSound) {
      return new SoundMsg(widget.model);
    } else if (msgType == "Video") {
      return VideoMsg(msg, widget.model);
    } else if (msgType == "Map"){
      return MapMsgView(msg, widget.model);
    }else {
      return new Text('未知消息');
    }
    //return new Text('未知消息');
    // return new TextMsg(msg['text'], widget.model);
  }
}
