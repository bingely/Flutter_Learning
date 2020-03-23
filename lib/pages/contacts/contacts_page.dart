import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/db/solution1/db_utils.dart';
import 'package:flutter_qyyim/common/provider/provider_widget.dart';
import 'package:flutter_qyyim/ui/ui.dart';
import 'package:flutter_qyyim/tool/device_utils.dart';
import 'package:flutter_qyyim/config/app.dart';
import 'package:flutter_qyyim/config/dictionary.dart';
import 'package:flutter_qyyim/ui/null_view.dart';
import 'package:flutter_qyyim/view_model/contact_view_model.dart';

import 'contact_item.dart';
import 'contact_view.dart';
import 'contacts.dart';

/// 联系人
class ContactsPage extends StatefulWidget {
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage>
    with AutomaticKeepAliveClientMixin {
  var indexBarBg = Colors.transparent;
  var currentLetter = '';
  var isNull = false;

  ScrollController sC;
  List<Contact> _contacts = [];
  StreamSubscription<dynamic> _messageStreamSubscription;

  List<ContactItem> _functionButtons = [
    new ContactItem(
        avatar: AppConstants.contactAssets + 'ic_new_friend.webp',
        title: '新的朋友'),
    new ContactItem(
        avatar: AppConstants.contactAssets + 'ic_group.webp', title: '群聊'),
    new ContactItem(
        avatar: AppConstants.contactAssets + 'ic_tag.webp', title: '标签'),
    new ContactItem(
        avatar: AppConstants.contactAssets + 'ic_no_public.webp', title: '公众号'),
  ];
  final Map _letterPosMap = {INDEX_BAR_WORDS[0]: 0.0};

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
      ProviderWidget<ContactViewModel>(
          model:ContactViewModel(),
        onModelReady: (modlue) {
          modlue.getContacts(_functionButtons, _contacts, _letterPosMap);
        },
        builder: (context, modlue, widget) {
          _contacts = modlue.contacts;
          return new ContactView(
              sC: sC, functionButtons: _functionButtons, contacts: _contacts);
        },
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
        appBar: AppBar(title: Text("联系人")), body: new Stack(children: body));
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
