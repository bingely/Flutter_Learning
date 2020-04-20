import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_qyyim/config/app.dart';
import 'package:flutter_qyyim/model/message.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// 聊天布局头像改造
//
class Avatars extends StatelessWidget {
  /// 构造函数
  const Avatars({Key key, this.message}) : super(key: key);

  /// 列表消息
  final SessionMsg message;

  @override
  Widget build(BuildContext context) {
    // 记录子部件
    final List<Widget> children = [];
    // 遍历
    final length = message.avatars.length;

    for (var i = 0; i < length; i++) {
      // 最多截取8个元素图片
      if (i >= 9) {
        break;
      }
      final icon = message.avatars[i];
      final isNetwork = icon.startsWith(RegExp(r'^http'));
      Widget child;
      double iconWH = 0;
      if (length == 1) {
        // 一张图，占全屏
        iconWH = ScreenUtil().setWidth(48 * 3);
      } else if (length < 5) {
        // 3/4
        iconWH = ScreenUtil().setWidth(63);
      } else {
        // 5/6/7/8/9
        iconWH = ScreenUtil().setWidth(36);
      }

      if (isNetwork) {
        child = CachedNetworkImage(
          imageUrl: icon,
          width: iconWH,
          height: iconWH,
          fit: BoxFit.cover,
          placeholder: (context, url) {
            return Image.asset(
              AppConstants.defIcon,
              width: iconWH,
              height: iconWH,
            );
          },
          errorWidget: (context, url, error) {
            return Image.asset(
              AppConstants.defIcon,
              width: iconWH,
              height: iconWH,
            );
          },
        );
      } else {
        child = Image.asset(
          icon,
          width: iconWH,
          height: iconWH,
        );
      }
      children.add(child);
    }
    final borderRadius = BorderRadius.circular(ScreenUtil().setWidth(18));
    return Container(
      width: ScreenUtil().setWidth(48 * 3),
      height: ScreenUtil().setWidth(48 * 3),
      decoration: BoxDecoration(
        color: Color(0xFFDDDEE0),
        borderRadius: borderRadius,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Wrap(
          alignment: WrapAlignment.center, //沿主轴方向居中
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: ScreenUtil().setWidth(6),
          runSpacing: ScreenUtil().setHeight(6),
          children: children,
          verticalDirection: VerticalDirection.up,
        ),
      ),
    );
  }
}
