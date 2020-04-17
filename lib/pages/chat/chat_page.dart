import 'dart:async';
import 'dart:math';

import 'package:extended_text_field/extended_text_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_qyyim/common/db/solution1/db_utils.dart';
import 'package:flutter_qyyim/common/provider/provider_widget.dart';
import 'package:flutter_qyyim/config/router_manger.dart';
import 'package:flutter_qyyim/model/message.dart';
import 'package:flutter_qyyim/pages/contacts/contacts.dart';
import 'package:flutter_qyyim/pages/qr/qr_page.dart';
import 'package:flutter_qyyim/tool/log_utils.dart';
import 'package:flutter_qyyim/tool/navigator_util.dart';
import 'package:flutter_qyyim/tool/device_utils.dart';

import 'package:flutter_qyyim/config/app.dart';
import 'package:flutter_qyyim/pages/chat/camarademo/camera_screen.dart';
import 'package:flutter_qyyim/testdemo/cross_data/event_bus.dart';
import 'package:flutter_qyyim/tool/toast_util.dart';
import 'package:flutter_qyyim/ui/commom_bar.dart';
import 'package:flutter_qyyim/ui/edit/text_span_builder.dart';
import 'package:flutter_qyyim/ui/main_input.dart';
import 'package:flutter_qyyim/ui/special_text/emoji_text.dart';
import 'package:flutter_qyyim/view_model/chat_view_model.dart';
import 'package:open_file/open_file.dart';

import 'chat_details_body.dart';
import 'chat_details_row.dart';
import 'chat_more_icon.dart';
import 'chat_more_page.dart';
import 'event/MsgEvent.dart';
import 'handle/message_handle.dart';
import 'indicator_page_view.dart';
import 'model/chat_data.dart';

// 底部按钮有3种状态
enum ButtonType { voice, emoj, more }

// 聊天page
class ChatPage extends StatefulWidget {
  final String title;
  final int type;
  final String id; // 单聊的话是目标用户id

  final SessionMsg message;

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
  double keyboardHeight = 267.0;

  TextEditingController _textController = TextEditingController();
  FocusNode _focusNode = new FocusNode();
  ScrollController _sC = ScrollController();
  PageController pageC = new PageController();

  StreamSubscription subscription;

  ChatViewModel chatViewModle;

  @override
  Future<void> initState() {
    super.initState();
    subscription = eventBus.on<MsgEvent>().listen((event) {
      _textController.clear();
      // 更新 msg
      chatViewModle.sendMgs(event);
    });

    // ScrollController 滑动的处理
    _sC.addListener(() {
     // FocusScope.of(context).requestFocus(new FocusNode());
      // 收紧软键盘
      if (_focusNode.hasFocus){

      }
      LogUtil.e('sC.addListener${_sC.offset}');
     // _focusNode.unfocus();
    });
    animaTo();


    _textController.addListener(() {
      LogUtil.v('textController.addListener');
    });
  }

  @override
  void dispose() {
    subscription.cancel(); //State 销毁时，清理注册
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var keyboardHeightMd = MediaQuery.of(context).viewInsets.bottom;
    keyboardHeight = max(keyboardHeight, keyboardHeightMd);

    var rWidget = [
      new InkWell(
        child: new Image.asset('assets/images/right_more.png'),
        onTap: () => NavigatorUtil.pushWithCuperino(context, QrPage()),
      )
    ];
    // 如果放在外面为啥会慢一拍？？TODO
    return Scaffold(
      appBar: new ComMomBar(
        title: widget.message != null ? widget.message.title : "",
        rightDMActions: rWidget,
      ),
      body: ProviderWidget<ChatViewModel>(
        model: ChatViewModel( widget.message.userId),
        onModelReady: (modle) {
          modle.initData();
          chatViewModle = modle;
        },
        builder: (context, modle, widgetcc) {
          chatData = modle?.list;
          return new MainInputBody(
            onTap: () => setState(() {
              LogUtil.d("MainInputBody--onTap()");
              _isMore = false;
              _isEmoj = false;
            }),
            decoration: BoxDecoration(color: AppColors.chatBg),
            child: new Column(children: [
              // 聊天list
              chatData != null
                  ? new ChatDetailsBody(sC: _sC, chatViewModel: modle)
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
                    chatViewModle.sendMgs(MsgEvent(
                        content: _textController.text.trim(), type: MsgType.TXT));
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
                height: (_isMore || _isEmoj) && !_focusNode.hasFocus
                    ? keyboardHeight
                    : 0.0,
                width: DeviceUtils.winWidth(context),
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
          callback: (imgs) {
        if (imgs.contains(",")) {
          var split = imgs.split(",");
          split.forEach((img){
            if (img.isNotEmpty) {
              chatViewModle.sendMgs(MsgEvent(content: img, type: MsgType.IMG));
            }
          });
        } else {
          chatViewModle.sendMgs(MsgEvent(content: imgs, type: MsgType.IMG));
        }
      });
    } else if (name == "拍摄") {
      openCamera(callback: (v) {
        if (v == null) return;
        print(v);
        chatViewModle.sendMgs(MsgEvent(content: v, type: MsgType.IMG));
      });
    } else if (name == "自定义视频") {
      final _cameraKey = GlobalKey<CameraScreenState>();
      //routePush(new VideoPage(key: _cameraKey));x
      Navigator.pushNamed(context, RouteName.video_page);
    } else if (name == "地图"){
      Navigator.pushNamed(context, RouteName.MAP);
    } else if (name == '文件'){
      FilePicker.getFile().then((file) async {
        // 路径（包含了名字），大小，
        chatViewModle.sendMgs(MsgEvent(content: file.path, fileSize: file.lengthSync().toString(),type: MsgType.FILE));
      });
    }
    else {
      sendVideoMsg(widget.id, widget.type, callback: (v) {
        if (v == null) return;
        print("视频地址" + v);
        chatViewModle.sendMgs(MsgEvent(content: v, type: MsgType.VIDEO));
      });
    }
  }

  Widget buildEmojiGird() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Image.asset(EmojiUitl.instance.emojiMap["[$index]"]),
          behavior: HitTestBehavior.translucent,
          onTap: () {
            insertEmojText("[$index]");
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
    var text2 = _textController.text;
    var start = value.selection.baseOffset;
    var end = text2.length;
    if (end>0) {
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

    setState(() {
      LogUtil.d('插入表情符到文字中');
    });
  }

  /// 切换底部状态
  onTapHandle(ButtonType type) {
    LogUtil.d('onTapHandle切换底部状态');
    SystemChannels.textInput.invokeMethod('TextInput.hide').whenComplete(() {
      Future.delayed(Duration(milliseconds: 200)).whenComplete(() {
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
      });
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
      onTap: () {
        LogUtil.d('ExtendedTextField---onTap');
        animaTo();
        setState(() {});
      },
      onChanged: (v) {
        LogUtil.d('ExtendedTextField---onChanged');
        animaTo();
        setState(() {});
      },
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

  animaTo() {
    /*Timer(Duration(milliseconds: 1400), () {
      LogUtil.d('animaTo---onChanged');
      //_sC.jumpTo(_sC.position.maxScrollExtent);
      _sC.animateTo(
        0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    });*/
  }
}
