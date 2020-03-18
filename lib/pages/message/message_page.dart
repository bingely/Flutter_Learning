import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/provider/provider_widget.dart';
import 'package:flutter_qyyim/config/router_manger.dart';
import 'package:flutter_qyyim/view_model/message_view_model.dart';
import 'package:flutter_qyyim/testdemo/trip/widget/webview.dart';
import 'package:flutter_qyyim/tool/check.dart';
import 'package:flutter_qyyim/tool/navigator_util.dart';
import 'package:flutter_qyyim/tool/toast_util.dart';
import 'package:flutter_qyyim/tool/win_media.dart';
import 'package:flutter_qyyim/pages/message/message_item.dart';
import 'package:flutter_qyyim/ui/pop/w_popup_menu.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/services.dart';

final List actions = [
  {"title": 'trip', 'icon': 'assets/images/contacts_add_newmessage.png'},
  {"title": 'wanna', 'icon': 'assets/images/ic_add_friend.webp'},
  {"title": 'Demo3', 'icon': ''},
  {"title": '扫一扫', 'icon': ''},
  {"title": '帮助与反馈', 'icon': ''},
];

class MessagePage extends StatefulWidget {
  @override
  MessagePageState createState() {
    return MessagePageState();
  }
}

class MessagePageState extends State<MessagePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("消息"),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              //跳转至搜索页面
              Navigator.pushNamed(context, RouteName.search);
            },
            child: Icon(
              //搜索图标
              Icons.search,
            ),
          ),
          new WPopupMenu(
            menuWidth: winWidth(context) / 2.5,
            alignment: Alignment.center,
            onValueChanged: (String value) {
              if (!strNoEmpty(value)) return;
              actionsHandle(value);
            },
            actions: actions,
            child: new Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              child: new Image.asset('assets/images/add_addressicon.png',
                  color: Colors.white, width: 22.0, fit: BoxFit.fitWidth),
            ),
          )
        ],
      ),
      body: ProviderWidget<MessageViewModel>(
        model: MessageViewModel(),
        onModelReady: (model) => model.initData(),
        builder: (context, model, widget) {
          return SmartRefresher(
            header: WaterDropHeader(),
            footer: ClassicFooter(),
            controller: model.refreshController,
            onRefresh: model.refresh,
            onLoading: model.loadMore,
            enablePullUp: false,
            child: ListView.builder(
                //传入数据长度
                itemCount: model.list.length,
                //构造列表项
                itemBuilder: (BuildContext context, int index) {
                  //传入messageData返回列表项
                  return MessageItem(model.list[index]);
                }),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  void actionsHandle(String value) {
    switch (value) {
      case "扫一扫":
        scan();
        break;
      case "帮助与反馈":
        NavigatorUtil.push(
            context,
            WebView(
                url: "https://www.baidu.com",
                title: "小鸟云官网",
                hideAppBar: false));
        break;
      case "trip":
        Navigator.pushNamed(context, RouteName.trip);
        break;
      case "wanna":
        Navigator.pushNamed(context, RouteName.wanna);
        break;
    }
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      print('扫码结果：' + barcode);
      ToastUtils.show('扫码结果：' + barcode, context);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        print('未授予APP相机权限');
      } else {
        print('扫码错误：$e');
      }
    } on FormatException {
      print('进入扫码页面后未扫码就返回');
    } catch (e) {
      print('扫码错误：$e');
    }
  }
}
