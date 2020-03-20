import 'dart:async';

import 'package:extended_text_field/extended_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/db/solution1/db_utils.dart';
import 'package:flutter_qyyim/common/provider/provider_widget.dart';
import 'package:flutter_qyyim/model/message.dart';
import 'package:flutter_qyyim/pages/contacts/contacts.dart';
import 'package:flutter_qyyim/pages/qr/qr_page.dart';
import 'package:flutter_qyyim/tool/navigator_util.dart';
import 'package:flutter_qyyim/tool/win_media.dart';

import 'package:flutter_qyyim/config/app.dart';
import 'package:flutter_qyyim/pages/chat/camarademo/camera_screen.dart';
import 'package:flutter_qyyim/testdemo/cross_data/event_bus.dart';
import 'package:flutter_qyyim/ui/commom_bar.dart';
import 'package:flutter_qyyim/ui/edit/text_span_builder.dart';
import 'package:flutter_qyyim/ui/main_input.dart';
import 'package:flutter_qyyim/ui/special_text/emoji_text.dart';
import 'package:flutter_qyyim/view_model/chat_view_model.dart';
import 'package:image_picker/image_picker.dart';

import 'chat_details_body.dart';
import 'chat_details_row.dart';
import 'chat_more_icon.dart';
import 'chat_more_page.dart';
import 'event/MsgEvent.dart';
import 'handle/message_handle.dart';
import 'indicator_page_view.dart';
import 'model/chat_data.dart';

// 底部按钮有两种状态
enum ButtonType { voice, emoj, more }

// 聊天page
class ChatPage extends StatefulWidget {
  final String title;
  final int type;
  final String id;

  final Message message;

  const ChatPage({Key key, this.title, this.type, this.id, this.message})
      : super(key: key);

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

  StreamSubscription subscription;

  ChatViewModel chatViewModle;

  @override
  Future<void> initState()  {
    super.initState();
    _sC.addListener(() => FocusScope.of(context).requestFocus(new FocusNode()));
    Timer(Duration(milliseconds: 1000), () => _sC.jumpTo(_sC.position.maxScrollExtent));

    subscription = eventBus.on<MsgEvent>().listen((event) {
      _textController.clear();
      // 更新 msg
      chatViewModle.sendMgs(event);
    });

    _textController.addListener((){
      if (mounted) {
        setState(() {
        });
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel(); //State 销毁时，清理注册
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var rWidget = [
      new InkWell(
        child: new Image.asset('assets/images/right_more.png'),
        onTap: ()=> NavigatorUtil.pushWithCuperino(context, QrPage()),
      )
    ];
    // 如果放在外面为啥会慢一拍？？TODO
    return Scaffold(
      appBar: new ComMomBar(
        title: widget.message != null ? widget.message.title : "",
        rightDMActions: rWidget,
      ),
      body: ProviderWidget<ChatViewModel>(
        model: ChatViewModel(),
        onModelReady: (modle) {
          modle.initData();
          chatViewModle = modle;
        },
        builder: (context, modle, widgetcc) {
          chatData = modle?.list;
          return new MainInputBody(
            onTap: () => setState(() => _isMore = false),
            decoration: BoxDecoration(color: AppColors.chatBg),
            child: new Column(children: [
              // 聊天list
              chatData != null
                  ? new ChatDetailsBody(sC: _sC,  chatViewModel: modle)
                  : new Spacer(),
              // 底部
              new ChatDetailsRow(
                voiceOnTap: () => onTapHandle(ButtonType.voice),
                emojOnTap: () {
                  onTapHandle(ButtonType.emoj);
                },
                isVoice: _isVoice,
                edit: edit,
                more: new ChatMoreIcon(
                  value: _textController.text,
                  onTap: () {
                    chatViewModle.sendMgs(
                        MsgEvent(content: _textController.text, type: MsgType.TXT));
                    _textController.clear();
                  },
                  moreTap: () {
                    onTapHandle(ButtonType.more);
                  },
                ),
                id: widget.id,
                type: widget.type,
              ),
              // 底部展开
              new Container(
                height:
                (_isMore || _isEmoj) && !_focusNode.hasFocus ? keyboardHeight : 0.0,
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
                      moreTap: (name) {
                        moreTap(name, context);
                      },
                    );
                  }),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }

  /// 点击底部的按钮事件
  void moreTap(name, BuildContext context) {
    if (name == '相册') {
      sendImageMsg(widget.id, widget.type,
          source: ImageSource.gallery, callback: (v) {
            if (v == null) return;
            print(v);
            chatViewModle.sendMgs(
                MsgEvent(content: v, type: MsgType.IMG));
          });
    } else if (name == "拍摄") {
      sendImageMsg(widget.id, widget.type,
          source: ImageSource.camera, callback: (v) {
            if (v == null) return;
            print(v);
            chatViewModle.sendMgs(
                MsgEvent(content: v, type: MsgType.VIDEO));
          });
    } else if (name == "自定义视频") {
      final _cameraKey = GlobalKey<CameraScreenState>();
      //routePush(new VideoPage(key: _cameraKey));
      Navigator.pushNamed(context, "video_page",
          arguments: "url")
          .then((url) {
        if (url != null) {
          print("video_page$url");
          // _handleSubmittedVideoData(url);
        }
      });
    } else {
      sendVideoMsg(widget.id, widget.type, callback: (v) {
        if (v == null) return;
        print("视频地址" + v);
        chatViewModle.sendMgs(
            MsgEvent(content: v, type: MsgType.VIDEO));
      });
    }
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
            insertEmojText("[${index + 1}]");
          },
        );
      },
      itemCount: EmojiUitl.instance.emojiMap.length,
      padding: EdgeInsets.all(5.0),
    );
  }

  /// 插入表情符到文字中
  void insertEmojText(String text) {
    var value = _textController.value;
    var start = value.selection.baseOffset;
    var end = value.selection.extentOffset;
    if (value.selection.isValid) {
      String newText = '';
      if (value.selection.isCollapsed) {
        if (end > 0) {
          newText += value.text.substring(0, end);
        }
        newText += text;
        if (value.text.length > end) {
          newText += value.text.substring(end, value.text.length);
        }
      } else {
        newText = value.text.replaceRange(start, end, text);
        end = start;
      }

      _textController.value = value.copyWith(
          text: newText,
          selection: value.selection.copyWith(
              baseOffset: end + text.length, extentOffset: end + text.length));
    } else {
      _textController.value = TextEditingValue(
          text: text,
          selection:
          TextSelection.fromPosition(TextPosition(offset: text.length)));
    }
  }

  /// 切换底部状态
  onTapHandle(ButtonType type) {
    setState(() {
      if (type == ButtonType.voice) {
        _focusNode.unfocus();
        _isMore = false;
        _isEmoj = false;
        _isVoice = !_isVoice;
      } else if (type == ButtonType.more) {
        _isVoice = false;
        _isEmoj = false;
        if (_focusNode.hasFocus) {
          _focusNode.unfocus();
          _isMore = true;
        } else {
          _isMore = !_isMore;
        }
      } else if (type == ButtonType.emoj) {
        _isVoice = false;
        _isMore = false;
        if (_focusNode.hasFocus) {
          _focusNode.unfocus();
          _isEmoj = true;
        } else {
          _isEmoj = !_isEmoj;
        }
      }
    });
  }

  /// 底部输入框wideget
  Widget edit(context, size) {
    // 计算当前的文本需要占用的行数
    TextSpan _text =
    TextSpan(text: _textController.text, style: AppStyles.ChatBoxTextStyle);

    TextPainter _tp = TextPainter(
        text: _text,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.left);
    _tp.layout(maxWidth: size.maxWidth);

    return ExtendedTextField(
      specialTextSpanBuilder: MySpecialTextSpanBuilder(showAtBackground: true),
      //onTap: () => print('onTap'),
      //onChanged: (v) => print('onChanged'),
      decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(left: 5.0)),
      controller: _textController,
      focusNode: _focusNode,
      maxLines: 99,
      cursorColor: const Color(AppColors.ChatBoxCursorColor),
      style: AppStyles.ChatBoxTextStyle,
    );
  }
}
