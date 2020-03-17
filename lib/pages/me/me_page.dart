import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/route/route.dart';
import 'package:flutter_qyyim/config/const.dart';
import 'package:flutter_qyyim/config/resource_mananger.dart';
import 'package:flutter_qyyim/config/router_manger.dart';
import 'package:flutter_qyyim/pages/me/list_tile_view.dart';
import 'package:flutter_qyyim/pages/search/search.dart';
import 'package:flutter_qyyim/tool/screen_utils.dart';
import 'package:flutter_qyyim/ui/image_view.dart';

import 'ImItem.dart';

class MePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("我的")),
      body: Column(
        children: <Widget>[HeadView(), BodyView()],
      ),
    );
  }
}

class HeadView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ImageView(
          img: ImageHelper.wrapAssets("mine/ic_setting.png"),
          width: 12,
          isRadius: true,
        ),
        Column(
          children: <Widget>[Text('hello'), Text('微信号')],
        )
      ],
    );
  }
}

class BodyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // 列表项
        Container(
          margin: EdgeInsets.only(top: 20.0),
          color: Colors.white,
          child: ImItem(
            title: '好友动态',
            imagePath: ImageHelper.wrapAssets("mine/ic_setting.png"),
          ),
        ),
        ListTileView(
          border: Border(bottom: BorderSide(color: lineColor, width: 0.2)),
          title: '设置',
          isLabel: false,
          icon: ImageHelper.wrapAssets("mine/ic_setting.png"),
          padding: EdgeInsets.symmetric(vertical: 16.0),
          width: 25.0,
          fit: BoxFit.cover,
          onPressed: () {},
        ),
        ListTileView(
          border: Border(bottom: BorderSide(color: lineColor, width: 0.2)),
          title: 'wanna',
          isLabel: false,
          icon: ImageHelper.wrapAssets("mine/ic_setting.png"),
          padding: EdgeInsets.symmetric(vertical: 16.0),
          width: 25.0,
          fit: BoxFit.cover,
          onPressed: () {
            Navigator.pushNamed(context, RouteName.wanna);
          },
        )
      ],
    );
  }
}
