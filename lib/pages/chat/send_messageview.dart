import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_qyyim/ui/message_view/Img_msg.dart';
import 'package:flutter_qyyim/ui/message_view/text_msg.dart';
import 'package:flutter_qyyim/ui/message_view/video_msg.dart';

import 'model/chat_data.dart';

class SendMessageView extends StatefulWidget {
  final ChatData model;

  SendMessageView(this.model);

  @override
  _SendMessageViewState createState() => _SendMessageViewState();
}

class _SendMessageViewState extends State<SendMessageView> {
  @override
  Widget build(BuildContext context) {
    Map msg = widget.model.msg;
    String msgType = msg['type'];
    String msgStr = msg.toString();

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
      //return new SoundMsg(widget.model);
    } else if (msgType == "Video") {
      return VideoMsg(msg, widget.model);
    } else {
      return new Text('未知消息');
    }
    //return new Text('未知消息');
    // return new TextMsg(msg['text'], widget.model);
  }
}
