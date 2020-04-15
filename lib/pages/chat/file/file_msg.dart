import 'dart:convert';

import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/provider/global_model.dart';
import 'package:flutter_qyyim/config/app.dart';
import 'package:flutter_qyyim/config/router_manger.dart';
import 'package:flutter_qyyim/pages/chat/model/chat_data.dart';
import 'package:flutter_qyyim/tool/check.dart';
import 'package:flutter_qyyim/tool/device_utils.dart';
import 'package:flutter_qyyim/tool/file_util.dart';
import 'package:flutter_qyyim/tool/misc.dart';
import 'package:flutter_qyyim/tool/navigator_util.dart';
import 'package:flutter_qyyim/tool/toast_util.dart';
import 'package:flutter_qyyim/ui/bubble/bublewidget.dart';
import 'package:flutter_qyyim/ui/message_view/msg_avatar.dart';
import 'package:flutter_qyyim/ui/ui.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';

class FileMsgView extends StatefulWidget {
  final msg;
  final ChatData model;

  const FileMsgView(this.msg, this.model);

  @override
  _MapMsgViewState createState() => new _MapMsgViewState();
}

class _MapMsgViewState extends State<FileMsgView> {
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

    final globalModel = Provider.of<GlobalModel>(context);
    var body = [
      new MsgAvatar(model: widget.model, globalModel: globalModel),
      new Expanded(
        child: GestureDetector(
          child: FLBubble(
            from: FLBubbleFrom.left,
            backgroundColor: Colors.white,
            child: new Container(
              width: 186,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(getPathName(msg['text'])),
                        SizedBox(
                          height: 6,
                        ),
                        Text(FileUtil.renderSize(double.parse(msg['filesize'])),
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ),
                  icontype(msg['text'])
                ],
              ),
            ),
          ),
          onTap: () {
            OpenFile.open(msg['text']).then((openresult) {
              ToastUtils.show(openresult.message, context);
            });
          },
        ),
      ),
      new Space(width: 120),
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

  String getPathName(String filePath) {
    return filePath.substring(filePath.lastIndexOf("/") + 1);
  }

  Widget icontype(String filepath) {
    String type = filepath.substring(filepath.lastIndexOf(".") + 1);
    switch (type) {
      case "pdf":
        return Icon(Icons.picture_as_pdf);
        break;
      case "doc":
        return Icon(Icons.translate);
        break;
      case "apk":
        return Icon(Icons.android);
        break;
      case "jpg":
        return Icon(Icons.import_contacts);
        break;
    }
    return Icon(Icons.device_unknown);
  }
}
