import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/pages/contacts/contacts_page.dart';
import 'package:flutter_qyyim/pages/me/me_page.dart';
import 'package:flutter_qyyim/pages/message/message_page.dart';

/// 用来放置几个大模块的容器页面
class RootPage extends StatefulWidget {
  @override
  RootPageState createState() {
    return RootPageState();
  }
}

class RootPageState extends State<RootPage> {
  // 当前选中的页面索引
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  中间显示的
      body: PageView(
        controller: _controller,
        children: <Widget>[
          new MessagePage(),
          new ContactsPage(),
          new MePage(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      // 底部导航按钮
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: ((index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
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
        icon: Icon(
          icon,
          color: _defaultColor,
        ),
        activeIcon: Icon(
          icon,
          color: _activeColor,
        ),
        title: Text(
          title,
          style: TextStyle(
              color: _currentIndex != index ? _defaultColor : _activeColor),
        ));
  }
}
