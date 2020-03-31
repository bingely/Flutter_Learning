import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/route/route.dart';
import 'package:flutter_qyyim/common/touch_callback.dart';
import 'package:flutter_qyyim/config/router_manger.dart';
import 'package:flutter_qyyim/tool/timeline_util.dart';
import 'package:flutter_qyyim/ui/image_view.dart';
import '../../model/message.dart';
import 'package:date_format/date_format.dart';

//聊天信息项
class MessageItem extends StatelessWidget {
  final SessionMsg message;

  MessageItem(this.message);

  @override
  Widget build(BuildContext context) {
    //最外层容器
    return FlatButton(
      onPressed: () {
        // 跳到对应的聊天页面
        Navigator.pushNamed(context, RouteName.chat, arguments: message);
      },
      //按下回调处理
      child: Container(
        height: 64,
        child: Row(
          //垂直方向居中显示
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //展示头像
            Badge(
              child: ImageView(
                img: message.avatar,
                width: 48.0,
                height: 48.0,
              ),
              badgeContent: Text(
                "3",
                style: TextStyle(color: Colors.white),
              ),
              showBadge: message.type == MessageType.GROUP,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 16),
                decoration: BoxDecoration(
                  //仅加一个底部边 这样整个列表的每项信息下面都会有一条边
                  border: Border(
                      bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9))),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      //垂直方向居中对齐
                      mainAxisAlignment: MainAxisAlignment.center,
                      //水平方向靠左对齐
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          message.title,
                          style: TextStyle(
                              fontSize: 16.0, color: Color(0xFF353535)),
                          maxLines: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                        ),
                        Text(
                          message.subTitle,
                          style: TextStyle(
                              fontSize: 14.0, color: Color(0xFFa9a9a9)),
                          maxLines: 1,
                          //显示不完的文本用省略号来表示
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Expanded(
                      child: SizedBox.shrink(),
                    ),
                    Container(
                      //时间顶部对齐
                      alignment: AlignmentDirectional.topStart,
                      margin: const EdgeInsets.only(top: 12.0),
                      child: Text(
                        //格式化时间
                        TimelineUtil.formatByDateTime(message.time),
                        style:
                            TextStyle(fontSize: 14.0, color: Color(0xFFa9a9a9)),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
