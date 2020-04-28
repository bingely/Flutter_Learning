import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/res/colors.dart';
import 'package:flutter_qyyim/common/res/dimens.dart';
import 'package:flutter_qyyim/common/res/gaps.dart';
import 'package:flutter_qyyim/tool/date_picker_util.dart';
import 'package:flutter_qyyim/ui/commom_bar.dart';
import 'package:flutter_qyyim/ui/commom_button.dart';
import 'package:flutter_qyyim/ui/search_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatSearchPage extends StatefulWidget {
  @override
  _ChatSearchPageState createState() => new _ChatSearchPageState();
}

class _ChatSearchPageState extends State<ChatSearchPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return new Scaffold(
      appBar: ComMomBar(title: '聊天记录'),
      body: Container(
        child: Column(
          children: <Widget>[
            SearchBar(
              onEdit: () {
                print('edit action ....');
              },
              onCancel: () {
                print('cancel action ....');
                //NavigatorUtil.goBack(context);
              },
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  ListView.builder(itemBuilder: (context, index) {
                    return Text('hh');
                  }),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      padding: EdgeInsets.only(left: Dimens.gap_dp16, right: Dimens.gap_dp16),
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          ComMomButton(
                            text: "上一页",
                            color: Colors.transparent,
                            style: TextStyle(color: Colors.blue),
                            onTap: () {
                              DatePickerUtil.showDataPicker(context);
                            },
                          ),
                          ComMomButton(
                            text: "下一页",
                            color: Colors.transparent,
                            style: TextStyle(color: Colors.blue),
                            onTap: () {
                              DatePickerUtil.showDataPicker(context);
                            },
                          ),
                          Expanded(
                            child: SizedBox.shrink(),
                          ),
                          ComMomButton(
                            text: "时间",
                            color: Colors.transparent,
                            style: TextStyle(color: Colors.blue),
                            onTap: () {
                              DatePickerUtil.showDataPicker(context);
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colours.bg_gray,
    );
  }
}
