import 'dart:convert';

import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/provider/global_model.dart';
import 'package:flutter_qyyim/config/app.dart';
import 'package:flutter_qyyim/pages/chat/model/chat_data.dart';
import 'package:flutter_qyyim/tool/check.dart';
import 'package:flutter_qyyim/tool/misc.dart';
import 'package:flutter_qyyim/tool/toast_util.dart';
import 'package:flutter_qyyim/ui/message_view/msg_avatar.dart';
import 'package:flutter_qyyim/ui/ui.dart';
import 'package:provider/provider.dart';

class MapMsgView extends StatefulWidget {
  final msg;
  final ChatData model;

  const MapMsgView(this.msg, this.model);
  @override
  _MapMsgViewState createState() => new _MapMsgViewState();
}

class _MapMsgViewState extends State<MapMsgView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> msg = json.decode(widget.model?.msg);

 /*   if (!strNoEmpty(msg['videosrc'])) return Text('发送中');
    var url = msg['videosrc'];*/


    final globalModel = Provider.of<GlobalModel>(context);
    var body = [
      new MsgAvatar(model: widget.model, globalModel: globalModel),
      new Space(width: AppConstants.mainSpace),
      new Expanded(
        child: new GestureDetector(
          child: new Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: new ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Stack(
                  children: <Widget>[
                    if (widget.model.mapPic != null) Image.memory(widget.model.mapPic)
                    //_controller.value.isPlaying?null:
                  ],
                ),
            ),
          ),
          onTap: () {

          },
        ),
      ),
      new Spacer(),
    ];
    if (widget.model.id == globalModel.account) {
      body = body.reversed.toList();
    } else {
      body = body;
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: new Row(children: body),
    );
  }

}