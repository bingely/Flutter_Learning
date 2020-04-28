import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/db/solution1/db_utils.dart';
import 'package:flutter_qyyim/common/provider/provider_widget.dart';
import 'package:flutter_qyyim/config/router_manger.dart';
import 'package:flutter_qyyim/model/message.dart';
import 'package:flutter_qyyim/pages/chat/event/MsgEvent.dart';
import 'package:flutter_qyyim/pages/chat/event/home_msg_event.dart';
import 'package:flutter_qyyim/pages/contacts/contacts.dart';
import 'package:flutter_qyyim/testdemo/cross_data/event_bus.dart';
import 'package:flutter_qyyim/testdemo/trip/widget/loading_container.dart';
import 'package:flutter_qyyim/tool/log_utils.dart';
import 'package:flutter_qyyim/ui/dialog_utils.dart';
import 'package:flutter_qyyim/view_model/message_view_model.dart';
import 'package:flutter_qyyim/testdemo/trip/widget/webview.dart';
import 'package:flutter_qyyim/tool/check.dart';
import 'package:flutter_qyyim/tool/navigator_util.dart';
import 'package:flutter_qyyim/tool/toast_util.dart';
import 'package:flutter_qyyim/tool/device_utils.dart';
import 'package:flutter_qyyim/pages/message/message_item.dart';
import 'package:flutter_qyyim/ui/pop/w_popup_menu.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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

  StreamSubscription subscription;

  MessageViewModel messageViewmodle;

  @override
  void initState() {
    super.initState();
    subscription = eventBus.on<HomeMsgEvent>().listen((event) {
      // 更新 msg
      messageViewmodle.initData();
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

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
            menuWidth: DeviceUtils.winWidth(context) / 2.5,
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
          messageViewmodle = model;
          return SmartRefresher(
            header: WaterDropHeader(),
            footer: ClassicFooter(),
            controller: model.refreshController,
            onRefresh: model.refresh,
            onLoading: model.loadMore,
            enablePullUp: false,
            child: (model.list == null || model.list.length == 0)
                ? LoadingDialog()
                : ListView.builder(
                    //传入数据长度
                    itemCount: model.list.length,
                    //构造列表项
                    itemBuilder: (BuildContext context, int index) {
                      //传入messageData返回列表项
                      return Slidable(
                        actionPane: SlidableScrollActionPane(),
                        //滑出选项的面板 动画
                        actionExtentRatio: 0.25,
                        child: MessageItem(model.list[index]),
                        secondaryActions: <Widget>[
                          IconSlideAction(
                            caption: '标志已读',
                            color: Colors.black45,
                            icon: Icons.more_horiz,
                            onTap: () => {
                              DialogUtils.showAlert(context, "标志已读")
                            },
                          ),
                          IconSlideAction(
                            caption: '删除',
                            color: Colors.red,
                            icon: Icons.delete,
                            closeOnTap: false,
                            onTap: () {
                              var sesstionMsg = model.list[index];
                              DialogUtils.showAlert(context, "删除后, 将清空该聊天的消息记录",)
                              DbUtils.getInstance().deleteItem(SessionMsg(),key: "id", value: sesstionMsg.id);
                              messageViewmodle.initData();
                            },
                          ),
                        ],
                      );
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
