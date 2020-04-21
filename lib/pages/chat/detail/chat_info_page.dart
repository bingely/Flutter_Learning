import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/config/app.dart';
import 'package:flutter_qyyim/config/resource_mananger.dart';
import 'package:flutter_qyyim/pages/chat/detail/contact_detail_page.dart';
import 'package:flutter_qyyim/pages/chat/detail/friend_choose_page.dart';
import 'package:flutter_qyyim/pages/me/list_tile_view.dart';
import 'package:flutter_qyyim/tool/device_utils.dart';
import 'package:flutter_qyyim/tool/navigator_util.dart';
import 'package:flutter_qyyim/ui/commom_bar.dart';
import 'package:flutter_qyyim/ui/commom_button.dart';
import 'package:flutter_qyyim/ui/image_view.dart';
import 'package:flutter_qyyim/ui/label_row.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatInfoPage extends StatefulWidget {
  @override
  _ChatInfoPageState createState() => new _ChatInfoPageState();
}

class _ChatInfoPageState extends State<ChatInfoPage> {
  bool swich_msg_disturb = false;
  bool swich_strong_remider = false;
  bool swich_sticky_chat = false;

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
    List<Widget> widgets = headUserIcons();
    return new Scaffold(
      backgroundColor: AppColors.chatBg,
      appBar: ComMomBar(
        title: "聊天信息",
      ),
      body: ListView(
        children: <Widget>[
          // 头像布局
          Container(
            padding: EdgeInsets.all(16),
            width: DeviceUtils.winWidth(context),
            color: Colors.white,
            child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 5,
                children: widgets,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8),
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

  List<Widget> headUserIcons() {
    List<Widget> widgets = List();
    widgets.add(InkWell(
      onTap: (){
        NavigatorUtil.pushWithCuperino(context, ContactDetailPage());
      },
      child: Column(
        children: <Widget>[
          ImageView(
            width: 55,
            height: 55,
            img: "https://randomuser.me/api/portraits/women/76.jpg",
          ),
          Expanded(child: Text('你好'))
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
    return widgets;
  }
}
