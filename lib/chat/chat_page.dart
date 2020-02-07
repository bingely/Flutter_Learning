import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_qyyim/chat/chat_details_row.dart';
import 'package:flutter_qyyim/chat/chat_more_icon.dart';
import 'package:flutter_qyyim/chat/chat_more_page.dart';
import 'package:flutter_qyyim/chat/indicator_page_view.dart';
import 'package:flutter_qyyim/chat/model/chat_data.dart';
import 'package:flutter_qyyim/config/const.dart';
import 'package:flutter_qyyim/ui/commom_bar.dart';
import 'package:flutter_qyyim/ui/main_input.dart';

// 聊天page
class ChatPage extends StatefulWidget{

  final String title;
  final int type;
  final String id;

  const ChatPage({Key key, this.title, this.type, this.id}) : super(key: key);

  @override
  ChatePageState createState() {
    return ChatePageState();
  }
}

class ChatePageState extends State<ChatPage>{
  List<ChatData> chatData = [];
  bool _isVoice = false;
  bool _isMore = false;
  double keyboardHeight = 270.0;

  TextEditingController _textController = TextEditingController();
  FocusNode _focusNode = new FocusNode();
  ScrollController _sC = ScrollController();
  PageController pageC = new PageController();


  @override
  Widget build(BuildContext context) {
    var rWidget = [
      new InkWell(
        child: new Image.asset('assets/images/right_more.png'),
      )
    ];

    var body = [

      new ChatDetailsRow(
        voiceOnTap: () => {},
        isVoice: _isVoice,
        edit: edit,
        more: new ChatMoreIcon(
          value: _textController.text,
          onTap: () => {},
          moreTap: () => {},
        ),
        id: widget.id,
        type: widget.type,
      ),
      new Container(
        height: _isMore && !_focusNode.hasFocus ? keyboardHeight : 0.0,
        width: 100.0,
        color: Colors.green,
        child: new IndicatorPageView(
          pageC: pageC,
          pages: List.generate(2, (index) {
            return new ChatMorePage(
              index: index,
              id: widget.id,
              type: widget.type,
              keyboardHeight: keyboardHeight,
            );
          }),
        ),
      ),
    ];


    return Scaffold(
      appBar: new ComMomBar(title: "聊天", rightDMActions: rWidget),
      body: new MainInputBody(
        //onTap: () => setState(() => _isMore = false),
        decoration: BoxDecoration(color: chatBg),
        child: new Column(children: body),
      ),
    );
  }


  Widget edit(context, size) {
    // 计算当前的文本需要占用的行数
    TextSpan _text =
    TextSpan(text: _textController.text);

    TextPainter _tp = TextPainter(
        text: _text,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.left);
    _tp.layout(maxWidth: size.maxWidth);

//    return ExtendedTextField(
//      specialTextSpanBuilder: TextSpanBuilder(showAtBackground: true),
//      onTap: () => setState(() {}),
//      onChanged: (v) => setState(() {}),
//      decoration: InputDecoration(
//          border: InputBorder.none, contentPadding: const EdgeInsets.all(5.0)),
//      controller: _textController,
//      focusNode: _focusNode,
//      maxLines: 99,
//      cursorColor: const Color(AppColors.ChatBoxCursorColor),
//      style: AppStyles.ChatBoxTextStyle,
//    );
    return TextField(
      controller: _textController,
      focusNode: _focusNode,
      maxLines: 99,
     // cursorColor: const Color(AppColors.ChatBoxCursorColor),
      decoration: InputDecoration(
          border: InputBorder.none, contentPadding: const EdgeInsets.all(5.0)),
      onTap: () => setState(() {}),
      onChanged: (v) => setState(() {}),
      //style: AppStyles.ChatBoxTextStyle,
    );
  }

}