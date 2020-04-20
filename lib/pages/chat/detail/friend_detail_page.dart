import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/config/app.dart';
import 'package:flutter_qyyim/config/resource_mananger.dart';
import 'package:flutter_qyyim/pages/me/list_tile_view.dart';
import 'package:flutter_qyyim/tool/device_utils.dart';
import 'package:flutter_qyyim/ui/commom_bar.dart';
import 'package:flutter_qyyim/ui/commom_button.dart';
import 'package:flutter_qyyim/ui/image_view.dart';
import 'package:flutter_qyyim/ui/label_row.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FriendDetailPage extends StatefulWidget {
  @override
  _FriendDetailPageState createState() => new _FriendDetailPageState();
}

class _FriendDetailPageState extends State<FriendDetailPage> {
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
            child: GridView.count(shrinkWrap: true,crossAxisCount: 5,children: widgets,crossAxisSpacing: 8, mainAxisSpacing: 8),
          ),

          LabelRow(
            label: "查找聊天记录",
            margin: EdgeInsets.only(top: 16),
          ),

          LabelRow(
            label: "消息免打扰",
            isRight: false,
            margin: EdgeInsets.only(top: 16),
            rightW: CupertinoSwitch(
              value: false,
              onChanged: (bool) {},
            ),
          ),
          LabelRow(
            label: "设置当前的聊天背景",
            margin: EdgeInsets.only(top: 16),
          ),
          LabelRow(
            label: "清空聊天记录",
          ),
        ],
      ),
    );
  }

  List<Widget> headUserIcons() {
    List<Widget> widgets = List();
    widgets.add(Column(
      children: <Widget>[
        ImageView(
          width: 55,
          height: 55,
          img: "https://randomuser.me/api/portraits/women/76.jpg",
        ),
        Expanded(child: Text('你好'))
      ],
    ));


    widgets.add(ImageView(
      width: 55,
      height: 55,
      img: ImageHelper.wrapAssets("chat/ic_details_add.png"),
    ));
    return widgets;
  }
}
