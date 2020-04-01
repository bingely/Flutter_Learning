
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/pages/contacts/contacts_page.dart';
import 'package:flutter_qyyim/pages/me/me_page.dart';
import 'package:flutter_qyyim/pages/message/message_page.dart';
import 'package:badges/badges.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<Widget> widegets = <Widget>[
  new MessagePage(),
  new ContactsPage(),
  new MePage(),
];

/// 用来放置几个大模块的容器页面
class TabNavigatorPage extends StatefulWidget {
  @override
  TabNavigatorPageState createState() {
    return TabNavigatorPageState();
  }
}

class TabNavigatorPageState extends State<TabNavigatorPage> {

  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  // 当前选中的页面索引
  int _currentIndex = 0;

  DateTime _lastPressed;


  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      //  中间显示的
      body: WillPopScope(
        onWillPop: () async{
          if (_lastPressed == null || DateTime.now().difference(_lastPressed)> Duration(seconds: 1)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressed = DateTime.now();
            return false;
          }
          return true;
        },
        child: PageView(
          controller: _controller,
          children: widegets,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
      // 底部导航按钮
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        unselectedFontSize: 12,
        selectedFontSize: 12.0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: ((index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
            print(index);
          });
        }),
        items: [
          _bottomItem('消息', Icons.chat, 0),
          _bottomItem('联系人', Icons.contacts, 1),
          _bottomItem('我', Icons.account_circle, 2),
        ],
      ),
    );
  }

  _bottomItem(String title, IconData icon, int index) {
    return BottomNavigationBarItem(
        icon: Badge(
          child: Icon(
            icon,
            color: _defaultColor,
          ),
          badgeContent: Text(
            "3",
            style: TextStyle(color: Colors.white),
          ),
          showBadge: icon == Icons.chat,
        ),
        activeIcon: Badge(
          child: Icon(
            icon,
            color: _activeColor,
          ),
          badgeContent: Text(
            "3",
            style: TextStyle(color: Colors.white),
          ),
          showBadge: icon == Icons.chat,
        ),
        title: Text(
          title,
          style: TextStyle(
              color: _currentIndex != index ? _defaultColor : _activeColor),
        ));
  }
}
