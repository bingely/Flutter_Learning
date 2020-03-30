import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/config/app.dart';
import 'package:flutter_qyyim/pages/chat/handle/message_handle.dart';
import 'package:flutter_qyyim/tool/check.dart';
import 'package:flutter_qyyim/common/route/route.dart';
import 'package:flutter_qyyim/ui/ui.dart';
import 'package:flutter_qyyim/pages/chat/model/chat_data.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:provider/provider.dart';

import '../../common/provider/global_model.dart';
import 'msg_avatar.dart';

class ImgMsg extends StatelessWidget {
  final msg;

  final ChatData model;

  ImgMsg(this.msg, this.model);

  @override
  Widget build(BuildContext context) {

    Map<String, dynamic> msg = json.decode(model?.msg);



    if (!strNoEmpty(msg['imageList'])) return Text('发送中');
   /* var msgInfo = msg['imageList'][1];
    var _height = msgInfo['height'].toDouble();
    var resultH = _height > 200.0 ? 200.0 : _height;
    var url = msgInfo['url'];*/


   var url = msg['imageList'];

    var _height;
    var resultH=200.0;
    Image image = Image.file(File.fromUri(Uri.parse(url)));
    // 预先获取图片信息
    image.image.resolve(new ImageConfiguration()).addListener(
        new ImageStreamListener((ImageInfo info, bool _) {
          _height = info.image.height;
          resultH = _height > 200.0 ? 200.0 : _height;

          print("testfilelist$_height");

          print("testfilelist$resultH");
        }));

    print("testfile---");


    var isFile = File(url).existsSync();
    final globalModel = Provider.of<GlobalModel>(context);
    var body = [
      new MsgAvatar(model: model, globalModel: globalModel),
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
              child: isFile
                  ? new Image.file(File(url))
                  : new CachedNetworkImage(
                      imageUrl: url, height: resultH, fit: BoxFit.cover),
            ),
          ),
          onTap: () => previewImage(url),
        ),
      ),
      new Spacer(),
    ];
    if (model.id == globalModel.account) {
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
