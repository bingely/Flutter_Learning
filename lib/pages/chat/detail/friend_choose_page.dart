import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/db/solution1/db_utils.dart';
import 'package:flutter_qyyim/common/provider/provider_widget.dart';
import 'package:flutter_qyyim/pages/contacts/contact_item.dart';
import 'package:flutter_qyyim/pages/contacts/contact_view.dart';
import 'package:flutter_qyyim/pages/contacts/contacts.dart';
import 'package:flutter_qyyim/tool/log_utils.dart';
import 'package:flutter_qyyim/tool/toast_util.dart';
import 'package:flutter_qyyim/ui/commom_bar.dart';
import 'package:flutter_qyyim/ui/commom_button.dart';
import 'package:flutter_qyyim/ui/image_view.dart';
import 'package:flutter_qyyim/ui/ui.dart';
import 'package:flutter_qyyim/tool/device_utils.dart';
import 'package:flutter_qyyim/config/app.dart';
import 'package:flutter_qyyim/config/dictionary.dart';
import 'package:flutter_qyyim/ui/null_view.dart';
import 'package:flutter_qyyim/view_model/contact_view_model.dart';

/// 联系人
class FriendChoosePage extends StatefulWidget {
  _FriendChoosePageState createState() => _FriendChoosePageState();
}

class _FriendChoosePageState extends State<FriendChoosePage>
    with AutomaticKeepAliveClientMixin {
  var indexBarBg = Colors.transparent;
  var currentLetter = '';
  var isNull = false;

  ScrollController sC;
  List<Contact> _contacts = [];
  StreamSubscription<dynamic> _messageStreamSubscription;

  List<ContactItem> _functionButtons = [];
  final Map _letterPosMap = {INDEX_BAR_WORDS[0]: 0.0};
  List<String> imgdatas = [];
  List<String> idDatas = [];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    sC = new ScrollController();

    List<Widget> body = [
      /// 联系人视图
      Column(
        children: <Widget>[
          Container(
            child: (imgdatas.length != 0)
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imgdatas.length,
                    itemBuilder: (context, index) {
                      String imgdata = imgdatas[index];
                      return ImageView(
                        img: imgdata,
                        width: 40,
                        height: 40,
                      );
                    })
                : Row(
                    children: <Widget>[Text('请选择联系人')],
                  ),
            height: 50,
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
          ),
          Expanded(
            child: ProviderWidget<ContactViewModel>(
              model: ContactViewModel(),
              onModelReady: (modlue) {
                modlue.getContacts(_functionButtons, _contacts, _letterPosMap);
              },
              builder: (context, modlue, child) {
                _contacts = modlue.contacts;
                return new ContactView(
                  type: ClickType.select,
                  sC: sC,
                  functionButtons: _functionButtons,
                  contacts: _contacts,
                  data: idDatas,
                  callback: (data) async {
                    idDatas = data;
                    imgdatas.clear();
                    if (data.length == 0) {
                      setState(() {});
                    } else {
                      data.forEach((value) async {
                        List<Contact> contacts = await DbUtils.getInstance()
                            .queryItems(Contact(), key: "id", value: value);
                        String img = contacts[0].avatar;
                        LogUtil.e("查询到的头像地址$img");
                        imgdatas.add(img);

                        if (data.lastIndexOf(value) == data.length - 1) {
                          setState(() {
                            LogUtil.e(
                                imgdatas.toString() + "----" + data.toString());
                          });
                        }
                      });
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),

      /// 右侧的字母视图
      new Positioned(
        width: AppConstants.IndexBarWidth,
        right: 0.0,
        top: 120.0,
        bottom: 120.0,
        child: new Container(
          color: indexBarBg,
          child: new LayoutBuilder(builder: _buildIndexBar),
        ),
      ),
    ];

    if (isNull) body.add(new HomeNullView(str: '无联系人'));

    /// 点击字母视图，浮起的弹框
    if (currentLetter != null && currentLetter.isNotEmpty) {
      var row = [
        new Container(
            width: AppConstants.IndexLetterBoxSize,
            height: AppConstants.IndexLetterBoxSize,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.IndexLetterBoxBg,
              borderRadius: BorderRadius.all(
                  Radius.circular(AppConstants.IndexLetterBoxSize / 2)),
            ),
            child: new Text(currentLetter,
                style: AppStyles.IndexLetterBoxTextStyle)),
        new Icon(Icons.arrow_right),
        new Space(width: AppConstants.mainSpace * 5),
      ];
      body.add(
        new Container(
          width: DeviceUtils.winWidth(context),
          height: DeviceUtils.winHeight(context),
          child:
              new Row(mainAxisAlignment: MainAxisAlignment.end, children: row),
        ),
      );
    }
    return new Scaffold(
        appBar: ComMomBar(
          title: "选择联系人",
          rightDMActions: <Widget>[
            ComMomButton(
              text: '确定(${idDatas.length})',
              style: TextStyle(color: Colors.white),
              width: 75.0,
              margin: EdgeInsets.all(10.0),
              radius: 4.0,
              onTap: () async {
                // 把
                if (idDatas.length == 0) {
                  ToastUtils.show("请选择联系人", context);
                } else {
                  // 形成群信息 TODO
                  ToastUtils.show("即将生成群信息"+idDatas.toString(), context);
                }
              },
            )
          ],
        ),
        body: new Stack(children: body));
  }

  String _getLetter(BuildContext context, double tileHeight, Offset globalPos) {
    RenderBox _box = context.findRenderObject();
    var local = _box.globalToLocal(globalPos);
    int index = (local.dy ~/ tileHeight).clamp(0, INDEX_BAR_WORDS.length - 1);
    return INDEX_BAR_WORDS[index];
  }

  void _jumpToIndex(String letter) {
    if (_letterPosMap.isNotEmpty) {
      final _pos = _letterPosMap[letter];
      if (_pos != null)
        sC.animateTo(_pos,
            curve: Curves.easeOut, duration: Duration(milliseconds: 200));
    }
  }

  Widget _buildIndexBar(BuildContext context, BoxConstraints constraints) {
    final List<Widget> _letters = INDEX_BAR_WORDS
        .map((String word) =>
            new Expanded(child: new Text(word, style: TextStyle(fontSize: 12))))
        .toList();

    final double _totalHeight = constraints.biggest.height;
    final double _tileHeight = _totalHeight / _letters.length;

    void jumpTo(details) {
      indexBarBg = Colors.black26;
      currentLetter = _getLetter(context, _tileHeight, details.globalPosition);
      _jumpToIndex(currentLetter);
      setState(() {});
    }

    void transparentMethod() {
      indexBarBg = Colors.transparent;
      currentLetter = null;
      setState(() {});
    }

    return new GestureDetector(
      onVerticalDragDown: (DragDownDetails details) => jumpTo(details),
      onVerticalDragEnd: (DragEndDetails details) => transparentMethod(),
      onVerticalDragUpdate: (DragUpdateDetails details) => jumpTo(details),
      child: new Column(children: _letters),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (sC != null) sC.dispose();
    if (_messageStreamSubscription != null) _messageStreamSubscription.cancel();
  }
}
