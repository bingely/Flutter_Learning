import 'package:flutter/material.dart';

import 'package:flutter_qyyim/config/app.dart';

import 'chat_voice.dart';

class ChatDetailsRow extends StatefulWidget {
  final GestureTapCallback voiceOnTap;
  final GestureTapCallback emojOnTap;
  final bool isVoice;
  final LayoutWidgetBuilder edit;
  final Widget more;
  final String id;
  final int type;

  ChatDetailsRow({
    this.voiceOnTap,
    this.emojOnTap,
    this.isVoice,
    this.edit,
    this.more,
    this.id,
    this.type,
  });

  ChatDetailsRowState createState() => ChatDetailsRowState();
}

class ChatDetailsRowState extends State<ChatDetailsRow> {
  String path;

  @override
  void initState() {
    super.initState();

    /*Notice.addListener(WeChatActions.voiceImg(), (v) {
      if (!v) return;
      if (!strNoEmpty(path)) return;
      sendSoundMessages(
        widget.id,
        path,
        2,
        widget.type,
        (value) => Notice.send(WeChatActions.msg(), v ?? ''),
      );
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: new Container(
        height: 50.0,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: Color(AppColors.ChatBoxBg),
          border: Border(
            top: BorderSide(color: AppColors.lineColor, width: AppConstants.DividerWidth),
            bottom: BorderSide(color: AppColors.lineColor, width: AppConstants.DividerWidth),
          ),
        ),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new InkWell(
              child: new Image.asset('assets/images/chat/ic_voice.webp',
                  width: 25),
              onTap: () {
                if (widget.voiceOnTap != null) {
                  widget.voiceOnTap();
                }
              },
            ),
            new Expanded(
              child: new Container(
                margin: const EdgeInsets.only(
                    top: 7.0, bottom: 7.0, left: 8.0, right: 8.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0)),
                child: widget.isVoice
                    ? new ChatVoice(
                  voiceFile: (path) {
                    setState(() => this.path = path);
                  },
                )
                    : new LayoutBuilder(builder: widget.edit),
              ),
            ),
            new InkWell(
              child: new Image.asset('assets/images/chat/ic_Emotion.webp',
                  width: 30, fit: BoxFit.cover),
              onTap: () {
                widget.emojOnTap();
              },
            ),
            widget.more,
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
