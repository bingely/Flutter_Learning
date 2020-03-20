import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/route/route.dart';
import 'package:flutter_qyyim/config/resource_mananger.dart';
import 'package:flutter_qyyim/config/router_manger.dart';
import 'package:flutter_qyyim/config/app.dart';
import 'package:flutter_qyyim/pages/me/label_row.dart';
import 'package:flutter_qyyim/pages/me/list_tile_view.dart';
import 'package:flutter_qyyim/pages/search/search.dart';
import 'package:flutter_qyyim/testdemo/trip/widget/webview.dart';
import 'package:flutter_qyyim/tool/navigator_util.dart';
import 'package:flutter_qyyim/tool/platform_utils.dart';
import 'package:flutter_qyyim/tool/screen_utils.dart';
import 'package:flutter_qyyim/ui/image_view.dart';
import 'package:flutter_qyyim/ui/label_row.dart';

import 'ImItem.dart';

class MePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: false,
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              flexibleSpace: ImageView(
                img: 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2458696988,2288615185&fm=26&gp=0.jpg',
              ),
              expandedHeight: 200.0,
            ),
            _divider(),
            BodyView(),
            BodyView(),
            BodyView(),
            BodyView(),
            BodyView(),
            BodyView(),
            BodyView(),
            BodyView(),
            BodyView(),
            BodyView(),
            BodyView(),
            BodyView(),
            BodyView(),
            BodyView(),
            BodyView(),
            BodyView(),
            BodyView(),
            BodyView(),
            BodyView(),
            BodyView(),
            BodyView(),
            BodyView()
          ],
        ),
      )),
    );
  }
}

SliverToBoxAdapter _divider() {
  return SliverToBoxAdapter(
    child: Container(
      height: 10.0,
      color: const Color.fromARGB(255, 247, 247, 247),
    ),
  );
}

class HeadView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
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
      ),
    );
  }
}

class BodyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          // 列表项
          ListTileView(
            border: Border(
                bottom: BorderSide(color: AppColors.lineColor, width: 0.2)),
            title: '设置',
            isLabel: false,
            icon: ImageHelper.wrapAssets("mine/ic_setting.png"),
            padding: EdgeInsets.symmetric(vertical: 16.0),
            width: 25.0,
            fit: BoxFit.cover,
            onPressed: () {
              NavigatorUtil.push(
                  context,
                  WebView(
                    url: "https://www.baidu.com",
                  ));
            },
          ),
          ListTileView(
            border: Border(
                bottom: BorderSide(color: AppColors.lineColor, width: 0.2)),
            title: '退出',
            isLabel: false,
            padding: EdgeInsets.symmetric(vertical: 16.0),
            width: 25.0,
            fit: BoxFit.cover,
            onPressed: () {
              exit(0);
            },
          ),
        ],
      ),
    );
  }
}
