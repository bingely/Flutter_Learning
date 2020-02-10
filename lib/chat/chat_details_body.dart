
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/chat/indicator_page_view.dart';
import 'package:flutter_qyyim/chat/model/chat_data.dart';
import 'package:flutter_qyyim/chat/send_messageview.dart';

class ChatDetailsBody extends StatelessWidget {
  final ScrollController sC;
  final List<ChatData> chatData;

  ChatDetailsBody({this.sC,this.chatData});

  @override
  Widget build(BuildContext context) {
    return new Flexible(
      child: new ScrollConfiguration(
        behavior: MyBehavior(),
        child: new ListView.builder(
          controller: sC,
          padding: EdgeInsets.all(8.0),
          reverse: true,
          itemBuilder: (context, int index) {
            ChatData model = chatData[index];
            return new SendMessageView(model);
          },
          itemCount: chatData.length,
          dragStartBehavior: DragStartBehavior.down,
        ),
      ),
    );
  }
}
