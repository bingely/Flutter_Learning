import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/db/solution1/db_utils.dart';
import 'package:flutter_qyyim/common/provider/provider_widget.dart';
import 'package:flutter_qyyim/config/app.dart';
import 'package:flutter_qyyim/config/resource_mananger.dart';
import 'package:flutter_qyyim/model/message.dart';
import 'package:flutter_qyyim/pages/chat/detail/contact_detail_page.dart';
import 'package:flutter_qyyim/pages/chat/detail/friend_choose_page.dart';
import 'package:flutter_qyyim/pages/contacts/contacts.dart';
import 'package:flutter_qyyim/pages/me/list_tile_view.dart';
import 'package:flutter_qyyim/testdemo/trip/widget/loading_container.dart';
import 'package:flutter_qyyim/tool/device_utils.dart';
import 'package:flutter_qyyim/tool/log_utils.dart';
import 'package:flutter_qyyim/tool/navigator_util.dart';
import 'package:flutter_qyyim/ui/commom_bar.dart';
import 'package:flutter_qyyim/ui/commom_button.dart';
import 'package:flutter_qyyim/ui/image_view.dart';
import 'package:flutter_qyyim/ui/label_row.dart';
import 'package:flutter_qyyim/view_model/chatinfo_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatInfoPage extends StatefulWidget {
  SessionMsg message;
  ChatInfoPage(this.message);

  @override
  _ChatInfoPageState createState() => new _ChatInfoPageState();
}

class _ChatInfoPageState extends State<ChatInfoPage> {
  bool swich_msg_disturb = false;
  bool swich_strong_remider = false;
  bool swich_sticky_chat = false;


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: AppColors.chatBg,
      appBar: ComMomBar(
        title: "聊天信息",
      ),
      body: ListView(
        children: <Widget>[
          // 头像布局
          ProviderWidget<ChatInfoVIewModel>(
            model: new ChatInfoVIewModel(),
            onModelReady: (modle){
              modle.headUserIcons(context,widget.message);
            },
            builder: (context, model, child){
              if (model.widgets.length == 0) {
                return LoadingContainer();
              } else {
                return Container(
                  padding: EdgeInsets.all(16),
                  width: DeviceUtils.winWidth(context),
                  color: Colors.white,
                  child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 5,
                      children: model.widgets,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),

                  /*child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, //每行三列
                        childAspectRatio: 1.0 //显示区域宽高相等
                    ),
                    itemCount: _icons.length,
                    itemBuilder: (context, index) {
                      //如果显示到最后一个并且Icon总数小于200时继续获取数据
                      if (index == _icons.length - 1 && _icons.length < 200) {
                        _retrieveIcons();
                      }
                      return Icon(_icons[index]);
                    }
                )*/
                );
              }
            },

          ),

          LabelRow(
            label: "查找聊天记录",
            margin: EdgeInsets.only(top: 16),
          ),
          SizedBox(
            height: 16,
          ),
          LabelRow(
            label: "消息免打扰",
            isRight: false,
            isLine: true,
            rightW: SizedBox(
              height: 25,
              child: CupertinoSwitch(
                value: swich_msg_disturb,
                onChanged: (newValue) {
                  setState(() {
                    swich_msg_disturb = newValue;
                  });
                },
              ),
            ),
          ),
          LabelRow(
            label: "置顶聊天",
            isRight: false,
            isLine: true,
            rightW: SizedBox(
              height: 25,
              child: CupertinoSwitch(
                value: swich_sticky_chat,
                onChanged: (newValue) {
                  setState(() {
                    swich_sticky_chat = newValue;
                  });
                },
              ),
            ),
          ),
          LabelRow(
            label: "强提醒",
            isRight: false,
            rightW: SizedBox(
              height: 25,
              child: CupertinoSwitch(
                value: swich_strong_remider,
                onChanged: (newValue) {
                  setState(() {
                    swich_strong_remider = newValue;
                  });
                },
              ),
            ),
          ),
          LabelRow(
            label: "设置当前的聊天背景",
            margin: EdgeInsets.only(top: 16),
          ),
          LabelRow(
            label: "清空聊天记录",
            margin: EdgeInsets.only(top: 16),
          ),
        ],
      ),
    );
  }

}
