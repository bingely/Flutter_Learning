import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/route.dart';
import 'package:flutter_qyyim/config/const.dart';
import 'package:flutter_qyyim/pages/chat/model/chat_data.dart';
import 'package:flutter_qyyim/provider/global_model.dart';

import '../image_view.dart';
class MsgAvatar extends StatelessWidget {
  final GlobalModel globalModel;
  final ChatData model;

  MsgAvatar({@required this.globalModel, @required this.model});

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      child: new Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        margin: EdgeInsets.only(right: 10.0),
        child: new ImageView(
          img: defIcon,
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        ),
      ),
      onTap: () {
        /*routePush(new ContactsDetailsPage(
          title: model.nickName,
          avatar: model.avatar,
          id: model.id,
        ));*/
      },
    );
  }
}
