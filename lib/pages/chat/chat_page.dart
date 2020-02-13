import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/win_media.dart';
import 'package:flutter_qyyim/config/const.dart';
import 'package:flutter_qyyim/config/contacts.dart';
import 'package:flutter_qyyim/ui/commom_bar.dart';
import 'package:flutter_qyyim/ui/main_input.dart';
import 'package:flutter_qyyim/ui/special_text/emoji_text.dart';

import 'chat_details_body.dart';
import 'chat_details_row.dart';
import 'chat_more_icon.dart';
import 'chat_more_page.dart';
import 'indicator_page_view.dart';
import 'model/chat_data.dart';

// 底部按钮有两种状态
enum ButtonType { voice, more }

// 聊天page
class ChatPage extends StatefulWidget {
  final String title;
  final int type;
  final String id;

  const ChatPage({Key key, this.title, this.type, this.id}) : super(key: key);

  @override
  ChatePageState createState() {
    return ChatePageState();
  }
}

class ChatePageState extends State<ChatPage> {
  List<ChatData> chatData = [];
  bool _isVoice = false;
  bool _isMore = false;
  bool _isEmoj = false;
  double keyboardHeight = 270.0;

  TextEditingController _textController = TextEditingController();
  FocusNode _focusNode = new FocusNode();
  ScrollController _sC = ScrollController();
  PageController pageC = new PageController();

  @override
  void initState() {
    super.initState();
    getChatMsgData();

    _sC.addListener(() => FocusScope.of(context).requestFocus(new FocusNode()));
    //initPlatformState();
    // Notice.addListener(WeChatActions.msg(), (v) => getChatMsgData());
  }

  @override
  Widget build(BuildContext context) {
    var rWidget = [
      new InkWell(
        child: new Image.asset('assets/images/right_more.png'),
      )
    ];

    var body = [
      // 聊天list
      chatData != null
          ? new ChatDetailsBody(sC: _sC, chatData: chatData)
          : new Spacer(),
      // 底部
      new ChatDetailsRow(
        voiceOnTap: () => onTapHandle(ButtonType.voice),
        emojOnTap: () {
          _isEmoj = true;
          onTapHandle(ButtonType.more);
        },
        isVoice: _isVoice,
        edit: edit,
        more: new ChatMoreIcon(
          value: _textController.text,
          onTap: () => _handleSubmittedData(_textController.text),
          moreTap: () {
            _isEmoj = false;
            onTapHandle(ButtonType.more);
          },
        ),
        id: widget.id,
        type: widget.type,
      ),
      // 底部展开
      new Container(
        height: _isMore && !_focusNode.hasFocus ? keyboardHeight : 0.0,
        width: winWidth(context),
        color: Color(AppColors.ChatBoxBg),
        child: _isEmoj
            ? buildEmojiGird()
            : new IndicatorPageView(
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
        onTap: () => setState(() => _isMore = false),
        decoration: BoxDecoration(color: chatBg),
        child: new Column(children: body),
      ),
    );
  }

  Widget buildEmojiGird() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Image.asset(EmojiUitl.instance.emojiMap["[${index + 1}]"]),
          behavior: HitTestBehavior.translucent,
          onTap: () {
            // insertText("[${index + 1}]");
          },
        );
      },
      itemCount: EmojiUitl.instance.emojiMap.length,
      padding: EdgeInsets.all(5.0),
    );
  }

  Future getChatMsgData() async {
    final str = await ChatDataRep().repData(widget.id, widget.type);
    List<ChatData> listChat = str;
    chatData.clear();
    chatData..addAll(listChat.reversed);

    // 异步函数setState()导致内存泄漏的错误。
    if (mounted) setState(() {});
  }

  onTapHandle(ButtonType type) {
    setState(() {
      if (type == ButtonType.voice) {
        _isEmoj = false;

        _focusNode.unfocus();
        _isMore = false;
        _isVoice = !_isVoice;
      } else if (type == ButtonType.more) {
        _isVoice = false;
        if (_focusNode.hasFocus) {
          _focusNode.unfocus();
          _isMore = true;
        } else {
          _isMore = !_isMore;
        }
      }
    });
  }

  _handleSubmittedData(String text) async {
    _textController.clear();
    chatData.insert(0, new ChatData(msg: {"text": text}));
    // 刷新数据源 TODO
    //await sendTextMsg('${widget.id}', widget.type, text);
    setState(() {});
  }

  Widget edit(context, size) {
    // 计算当前的文本需要占用的行数
    TextSpan _text = TextSpan(text: _textController.text, style: AppStyles.ChatBoxTextStyle);

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
      cursorColor: const Color(AppColors.ChatBoxCursorColor),
      decoration: InputDecoration(
          border: InputBorder.none, contentPadding: const EdgeInsets.all(5.0)),
      onTap: () => setState(() {}),
      onChanged: (v) => setState(() {}),
      style: AppStyles.ChatBoxTextStyle,
    );
  }
}
