import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/res/colors.dart';
import 'package:flutter_qyyim/config/resource_mananger.dart';
import 'package:flutter_qyyim/config/t.dart';
import 'package:flutter_qyyim/tool/date_picker_util.dart';
import 'package:flutter_qyyim/view_model/keyboard_provider.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

/// 闪屏跳转模式
enum MHSearchType {
  /// 朋友圈
  moments,

  /// 文章
  article,

  /// 公众号
  officialAccounts,

  /// 小程序
  applet,

  /// 音乐
  music,

  /// 表情
  emotion,
}

class SearchContent extends StatefulWidget {
  Callback callback;

  SearchContent({Key key,this.callback}) : super(key: key);

  _SearchContentState createState() => _SearchContentState();
}

class _SearchContentState extends State<SearchContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KeyboardProvider>(context);
    double bottom = provider.keyboardHeight <= 0
        ? ScreenUtil().setHeight(-240)
        : (provider.keyboardHeight + ScreenUtil().setHeight(72));
    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Container(
        constraints: BoxConstraints.expand(),
        color: Colours.pBackgroundColor,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: ListView(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(146.0)),
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        '搜索指定内容',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(45.0),
                          color: Color(0xFFB1B1B1),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(108.0)),
                      // 类型相关的
                      _buidAppointContentWidget(),
                    ],
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 200),
              bottom: bottom,
              width: ScreenUtil().setWidth(171.0),
              height: ScreenUtil().setHeight(240.0),
              // Fixed Bug: SVG 不能放在有固定大小的 Container 中，否则设置 SVG 大小无效
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    top: 0,
                    child: Container(
                      width: ScreenUtil().setWidth(171.0),
                      height: ScreenUtil().setWidth(171.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            ScreenUtil().setWidth(171.0 * 0.5)),
                      ),
                    ),
                  ),
                  Positioned(
                    top: ScreenUtil().setWidth(81.0 * 0.5),
                    child: new SvgPicture.asset(
                      ImageHelper.wrapAssets(
                          'icons_filled_voiceinput_white.svg'),
                      color: Color(0xFF666666),
                      width: ScreenUtil().setWidth(90.0),
                      height: ScreenUtil().setWidth(90.0),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Text(
                      '按住 说话',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(36.0),
                        color: Color(0xFFA6A6A6),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 构建指定内容页
  Widget _buidAppointContentWidget() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buidAppointContentItemWidget(
              title: "日期",
              index: 0,
              type: MHSearchType.moments,
            ),
            _buidAppointContentItemWidget(
              title: "图片及视频",
              index: 1,
              type: MHSearchType.article,
            ),
            _buidAppointContentItemWidget(
              title: "文件",
              index: 2,
              type: MHSearchType.article,
            ),
          ],
        ),
        SizedBox(
          height: ScreenUtil().setHeight(99.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buidAppointContentItemWidget(
              title: "xxx",
              index: 0,
              type: MHSearchType.applet,
            ),
            _buidAppointContentItemWidget(
              title: "音乐",
              index: 1,
              type: MHSearchType.music,
            ),
            _buidAppointContentItemWidget(
              title: "表情",
              index: 2,
              type: MHSearchType.emotion,
            ),
          ],
        ),
      ],
    );
  }

  /// 构建某个内容页
  Widget _buidAppointContentItemWidget({
    String title,
    int index,
    MHSearchType type,
  }) {
    return InkWell(
      onTap: () {
        print('Search Content On Tap 👉  $title ');
        if (index == 0) {
          //DatePickerUtil.showDataPicker(context);
        }
        widget.callback(index.toString());

      },
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.tightFor(
          width: ScreenUtil().setWidth(330.0),
          height: ScreenUtil().setHeight(66.0),
        ),
        decoration: BoxDecoration(
          border: index == 2
              ? null
              : Border(right: BorderSide(color: Color(0xFFC9C9C9))),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(51.0),
            color: Color(0xFF576B94),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
