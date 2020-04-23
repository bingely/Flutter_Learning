
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/db/solution1/db_utils.dart';
import 'package:flutter_qyyim/common/provider/view_state_model.dart';
import 'package:flutter_qyyim/config/app.dart';
import 'package:flutter_qyyim/config/resource_mananger.dart';
import 'package:flutter_qyyim/model/message.dart';
import 'package:flutter_qyyim/pages/chat/detail/contact_detail_page.dart';
import 'package:flutter_qyyim/pages/chat/detail/friend_choose_page.dart';
import 'package:flutter_qyyim/pages/contacts/contacts.dart';
import 'package:flutter_qyyim/tool/log_utils.dart';
import 'package:flutter_qyyim/tool/navigator_util.dart';
import 'package:flutter_qyyim/ui/image_view.dart';

class ChatInfoVIewModel extends ViewStateModel {

  List<Widget> widgets = List();
  headUserIcons(BuildContext context, SessionMsg sessionMsg)  async {

    if (sessionMsg.type == MessageType.GROUP) {
      String idDatas = sessionMsg.userId;
      LogUtil.e("================"+idDatas);
      List<String> split = idDatas.split(',');
      split.forEach((userid) async {
        List<Contact> contacts = await DbUtils.getInstance()
            .queryItems(Contact(), key: "id", value: userid);
        Contact contact = contacts[0];

        LogUtil.e("headUserIcons====${contact.avatar}");
        widgets.add(InkWell(
          onTap: (){
            NavigatorUtil.pushWithCuperino(context, ContactDetailPage());
          },
          child: Column(
            children: <Widget>[
              ImageView(
                width: 55,
                height: 55,
                img: '${contact.avatar}',
              ),
              Expanded(child: Text('${contact.name}'))
            ],
          ),
        ));

        if(split.lastIndexOf(userid)== split.length -1) {


          widgets.add(InkWell(
            onTap: (){
              NavigatorUtil.pushWithCuperino(context, FriendChoosePage());
            },
            child: Container(
              child: ImageView(
                width: 55,
                height: 55,
                img: ImageHelper.wrapAssets("chat/ic_details_add.png"),
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.lineColor, width: 0.2)),
            ),
          ));


          setIdle();
          LogUtil.e("headUserIcons====headUserIcons====headUserIcons====headUserIcons====");
        }
      });
    } else{
      List<Contact> contacts = await DbUtils.getInstance()
          .queryItems(Contact(), key: "id", value: sessionMsg.userId);
      Contact contact = contacts[0];
      LogUtil.e("headUserIcons====${contact.avatar}");

      widgets.add(InkWell(
        onTap: (){
          NavigatorUtil.pushWithCuperino(context, ContactDetailPage());
        },
        child: Column(
          children: <Widget>[
            ImageView(
              width: 55,
              height: 55,
              img: '${contact.avatar}',
            ),
            Expanded(child: Text('${contact.name}'))
          ],
        ),
      ));

      widgets.add(InkWell(
        onTap: (){
          NavigatorUtil.pushWithCuperino(context, FriendChoosePage());
        },
        child: Container(
          child: ImageView(
            width: 55,
            height: 55,
            img: ImageHelper.wrapAssets("chat/ic_details_add.png"),
          ),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.lineColor, width: 0.2)),
        ),
      ));


      setIdle();

      LogUtil.e("headUserIcons====headUserIcons====headUserIcons====headUserIcons====");

    }


  }

}