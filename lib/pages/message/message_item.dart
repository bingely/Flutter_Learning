
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/route/route.dart';
import 'package:flutter_qyyim/common/touch_callback.dart';
import 'package:flutter_qyyim/ui/image_view.dart';
import 'message.dart';
import 'package:date_format/date_format.dart';

//聊天信息项
class MessageItem extends StatelessWidget {
  final Message message;

  MessageItem(this.message);

  @override
  Widget build(BuildContext context) {
    //最外层容器
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        //仅加一个底部边 这样整个列表的每项信息下面都会有一条边
        border:
            Border(bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9))),
      ),
      height: 64.0,
      //按下回调处理
      child: TouchCallBack(
        onPressed: () {
          // 跳到对应的聊天页面
          Navigator.pushNamed(context, 'chat');
        },
        //整体水平方向布局
        child: Row(
          //垂直方向居中显示
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //展示头像
            Container(
              //头像左右留一定的外边距
              margin: const EdgeInsets.only(left: 13.0, right: 13.0),
              child: Badge(
                /*child: ImageView(
                  message.avatar,
                  width: 48.0,
                  height: 48.0,
                ),*/
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
            ),
            Expanded(
              //主标题和子标题采用垂直布局
              child: Column(
                //垂直方向居中对齐
                mainAxisAlignment: MainAxisAlignment.center,
                //水平方向靠左对齐
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    message.title,
                    style: TextStyle(fontSize: 16.0, color: Color(0xFF353535)),
                    maxLines: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                  ),
                  Text(
                    message.subTitle,
                    style: TextStyle(fontSize: 14.0, color: Color(0xFFa9a9a9)),
                    maxLines: 1,
                    //显示不完的文本用省略号来表示
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Container(
              //时间顶部对齐
              alignment: AlignmentDirectional.topStart,
              margin: const EdgeInsets.only(right: 12.0, top: 12.0),
              child: Text(
                //格式化时间
                formatDate(message.time, [HH, ':', nn, ':', 'ss']).toString(),
                style: TextStyle(fontSize: 14.0, color: Color(0xFFa9a9a9)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
