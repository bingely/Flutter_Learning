import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/pages/contacts/contacts.dart';
import 'package:flutter_qyyim/pages/me/me_page.dart';
import 'package:flutter_qyyim/pages/message/message_page.dart';

class AppPage extends StatefulWidget {
  @override
  AppPageState createState() {
    return AppPageState();
  }
}

class AppPageState extends State<AppPage> {
  // 当前选中的页面索引
  var _currenIndex = 0;

  var _titleTab = "消息";

  // 消息列表页面
  MessagePage messagePage;

  // 联系人页面
  Contacts contactPage;

  // 我的页面
  MePage mePage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleTab),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              //跳转至搜索页面
              Navigator.pushNamed(context, 'search');
            },
            child: Icon(
              //搜索图标
              Icons.search,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 20.0),
            child: GestureDetector(
              onTap: (){
                //
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(500.0, 76.0, 10.0, 0.0),
                  items: <PopupMenuEntry>[

                  ]
                );
              },
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      //  中间显示的
      body: currenPage(),
      // 底部导航按钮
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currenIndex,
        onTap: ((index) {
          setState(() {
            _currenIndex = index;
          });
        }),
        items: [
          BottomNavigationBarItem(
              title: Text(
                '消息',
                style: TextStyle(
                    color: _currenIndex == 0 ? Color(0xFF46c01b) : Color(
                        0xff999999)
                ),
              ),
              icon: _currenIndex == 0 ? Image.asset(
                'images/message_pressed.png', width: 32.0,height: 28.0,):Image.asset('images/message_normal.png', width: 32.0,height: 28.0)
              //icon: _currenIndex == 0 ? Image.asset('images/message_press.png'): I,
          ),
          BottomNavigationBarItem(
              title: Text(
                '联系人',
                style: TextStyle(
                    color: _currenIndex == 1 ? Color(0xFF46c01b) : Color(
                        0xff999999)
                ),
              ),
              icon: _currenIndex == 1 ? Image.asset(
                'images/contact_list_pressed.png', width: 32.0,height: 28.0,):Image.asset('images/contact_list_normal.png', width: 32.0,height: 28.0)
            //icon: _currenIndex == 0 ? Image.asset('images/message_press.png'): I,
          ),
          BottomNavigationBarItem(
              title: Text(
                '我',
                style: TextStyle(
                    color: _currenIndex == 2 ? Color(0xFF46c01b) : Color(
                        0xff999999)
                ),
              ),
              icon: _currenIndex == 2 ? Image.asset(
                'images/profile_pressed.png', width: 32.0,height: 28.0,):Image.asset('images/profile_normal.png', width: 32.0,height: 28.0)
            //icon: _currenIndex == 0 ? Image.asset('images/message_press.png'): I,
          ),
        ],
      ),
    );
  }

  // code: 此处不是break
  currenPage() {
    switch (_currenIndex) {
      case 0:
        if (messagePage == null) {
          messagePage = new MessagePage();
        }
        _titleTab = "消息";
        return messagePage;
      case 1:
        if (contactPage == null) {
          contactPage = new Contacts();
        }
        _titleTab = "联系人";
        return contactPage;
      case 2:
        if (mePage == null) {
          mePage = new MePage();
        }
        _titleTab = "我";
        return mePage;
    }
    setState(() {
    });
  }
}


// 这个怎么抽离
class _BottomNavigationBarWidget extends BottomNavigationBar {
  //type: BottomNavigationBarType
}
