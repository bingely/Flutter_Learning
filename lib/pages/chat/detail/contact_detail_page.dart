import 'package:flutter/material.dart';
import 'package:flutter_qyyim/config/app.dart';
import 'package:flutter_qyyim/ui/commom_bar.dart';
import 'package:flutter_qyyim/ui/dialog_utils.dart';
import 'package:flutter_qyyim/ui/image_view.dart';
import 'package:flutter_qyyim/ui/label_row.dart';

class ContactDetailPage extends StatefulWidget {
  @override
  _ContactDetailPageState createState() => new _ContactDetailPageState();
}

class _ContactDetailPageState extends State<ContactDetailPage> {
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
    return new Scaffold(
      backgroundColor: AppColors.chatBg,
      appBar: ComMomBar(
        rightDMActions: <Widget>[
          new InkWell(
            child: new Image.asset('assets/images/right_more.png'),
            onTap: (){
              //DialogUtils.showModalBottomSheetDialog(context);
              //codeDialog(context);
              //shoCam(context);
              showBt(context);

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
              onTap: () {},
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

  Widget userInfoHeadView() {
    return Container(
      padding: EdgeInsets.all(AppConstants.Container_MARGIN),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ImageView(
            height: 70,
            width: 70,
            img: "https://randomuser.me/api/portraits/women/76.jpg",
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
                    "bingley",
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
                child: Text("昵称：bingleynick"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text("qim号： 111300"),
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
