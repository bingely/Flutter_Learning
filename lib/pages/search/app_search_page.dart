import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/db/solution1/db_utils.dart';
import 'package:flutter_qyyim/common/net/rxhttp/utils/tesxt_util.dart';
import 'package:flutter_qyyim/common/res/colors.dart';
import 'package:flutter_qyyim/config/router_manger.dart';
import 'package:flutter_qyyim/model/message.dart';
import 'package:flutter_qyyim/pages/chat/chatsearch/search_chat_item.dart';
import 'package:flutter_qyyim/pages/chat/model/chat_data.dart';
import 'package:flutter_qyyim/pages/search/search_content.dart';
import 'package:flutter_qyyim/testdemo/trip/model/seach_model.dart';
import 'package:flutter_qyyim/tool/date_picker_util.dart';
import 'package:flutter_qyyim/tool/log_utils.dart';
import 'package:flutter_qyyim/tool/navigator_util.dart';
import 'package:flutter_qyyim/ui/search_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSearchPage extends StatefulWidget {
  SessionMsg message;

  AppSearchPage({this.message});

  @override
  _AppSearchPageState createState() => new _AppSearchPageState();
}

class _AppSearchPageState extends State<AppSearchPage> {
  bool isSearchMode = false;
  List<ChatData> mChatdatas;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return new Scaffold(
      body: Container(
        // 距离顶部一段距离
        margin: EdgeInsets.only(top: 35.0),
        child: Column(
          children: <Widget>[
            SearchBar(
              onCancel: () {
                print('cancel action ....');
                NavigatorUtil.goBack(context);
              },
              valueChanged: (searchContent) async {
                if (!TextUtil.isEmpty(searchContent)) {
                 // List<ChatData> chatdatas = await DbUtils.getInstance().rawQueryLike(ChatData(),key: "userId",value: widget.message.userId,msg: searchContent);
                  List<ChatData> chatdatas =  await DbUtils.getInstance().queryItemsLimit(ChatData(),
                      limit: 90,
                      offset: 0,
                      orderBy: "id Desc",
                      key: "chatId",
                      value: widget.message.userId);
                  mChatdatas = chatdatas;

                 // List<ChatData> chatdatas = await DbUtils.getInstance().queryItemsLimit(ChatData(),key: "userId",value: widget.message.userId,msg: searchContent);
                  LogUtil.e("=====>chatdata$chatdatas");
                }
                setState(() {
                  isSearchMode = TextUtil.isEmpty(searchContent) ? false : true;
                  // 搜索逻辑 TODO
                });
              },
            ),
            Expanded(
                child: isSearchMode
                    ? ListView.builder(itemBuilder: (context, index) {
                        return SearchChatItem(mChatdatas[index]);
                      })
                    : SearchContent(
                        callback: (indexStr) async {
                          var sarchIndex = int.parse(indexStr);
                          switch (sarchIndex) {
                            case 0:
                              DateTime chooseDateTime =
                                  await DatePickerUtil.showDataPicker(context);
                              /*Navigator.pushNamed(context, RouteName.chat,
                                  arguments: widget.message);*/
                              break;
                            case 1:
                              // 图片及视频搜索

                              break;
                          }

                          Navigator.pushNamed(context, RouteName.chat,
                              arguments: widget.message);
                        },
                      ))
          ],
        ),
      ),
      backgroundColor: Colours.bg_gray,
    );
  }
}
