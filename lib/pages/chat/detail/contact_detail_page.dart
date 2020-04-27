import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/db/solution1/db_utils.dart';
import 'package:flutter_qyyim/config/app.dart';
import 'package:flutter_qyyim/config/router_manger.dart';
import 'package:flutter_qyyim/model/message.dart';
import 'package:flutter_qyyim/pages/contacts/contacts.dart';
import 'package:flutter_qyyim/ui/commom_bar.dart';
import 'package:flutter_qyyim/ui/dialog/action_sheet.dart';
import 'package:flutter_qyyim/ui/dialog_utils.dart';
import 'package:flutter_qyyim/ui/image_view.dart';
import 'package:flutter_qyyim/ui/label_row.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactDetailPage extends StatefulWidget {
  SessionMsg sessionMsg;

  ContactDetailPage({this.sessionMsg});

  @override
  _ContactDetailPageState createState() => new _ContactDetailPageState();
}

class _ContactDetailPageState extends State<ContactDetailPage> {
  Contact contact;

  @override
  void initState() {
    super.initState();

    DbUtils.getInstance()
        .queryItems(Contact(), key: "id", value: widget.sessionMsg.userId)
        .then((contacts) {
      contact = contacts[0];

      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: AppColors.chatBg,
      appBar: ComMomBar(
        rightDMActions: <Widget>[
          new InkWell(
            child: new Image.asset('assets/images/right_more.png'),
            onTap: () {
              showRightActionDialog(context);
              //DialogUtils.showLoadingDialog(context);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            userInfoHeadView(),
            SizedBox(
              height: 1,
            ),
            LabelRow(
              label: "设置备注和标签",
              isLine: true,
            ),
            LabelRow(
              label: "朋友权限",
              isLine: true,
            ),
            LabelRow(
              label: "电话号码",
            ),
            LabelRow(
              margin: EdgeInsets.only(top: AppConstants.Container_MARGIN),
              label: "更多信息",
            ),
            SizedBox(
              height: AppConstants.Container_MARGIN,
            ),
            InkWell(
              child: Container(
                height: 50,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.message),
                    SizedBox(
                      width: 8,
                    ),
                    Text('发消息')
                  ],
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, RouteName.chat, arguments: widget.sessionMsg);
              },
            ),
            SizedBox(
              height: 1,
            ),
            InkWell(
              child: Container(
                height: 50,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.video_call),
                    SizedBox(
                      width: 8,
                    ),
                    Text('音视频通话')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showRightActionDialog(BuildContext context) {
    //DialogUtils.showModalBottomSheetDialog(context);
    //codeDialog(context);
    //shoCam(context);
    //showBt(context);

    DialogUtils.showModalBottomSheetDialog(
      context,
      actions: <Widget>[
        ActionSheetAction(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('设置备注和标签')),
        ActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('把她推荐给朋友'),
        ),
        ActionSheetAction(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('设为星标好友')),
        ActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('设置朋友圈和视频动态权限'),
        ),
        ActionSheetAction(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('加入黑名单')),
        ActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('投诉'),
        ),
        ActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('删除'),
        ),
      ],
      cancelButton: ActionSheetAction(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('取消'),
      ),
    );
  }

  Widget userInfoHeadView() {
    if (contact == null) {
      return LoadingDialog();
    } else {
      return Container(
        padding: EdgeInsets.all(AppConstants.Container_MARGIN),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ImageView(
              height: 70,
              width: 70,
              img: contact.avatar,
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      contact.name,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    // 判断sex
                    Icon(Icons.face)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text("昵称：${contact.name}"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text("qim号： ${contact.id}"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text("地址：福建 福州"),
                ),
              ],
            )
          ],
        ),
      );
    }
  }
}
