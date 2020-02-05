import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/contacts/contact_page.dart';
import 'package:flutter_qyyim/me/me_page.dart';
import 'package:flutter_qyyim/message/message_page.dart';

class AppPage extends StatefulWidget {
  @override
  AppPageState createState() {
    return AppPageState();
  }
}

class AppPageState extends State<AppPage> {
  // 当前选中的页面索引
  var _currenIndex = 0;

  // 消息列表页面
  MessagePage messagePage;

  // 联系人页面
  ContactPage contactPage;

  // 我的页面
  MePage mePage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("qqyim"),
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
                        0xff99999)
                ),
              ),
              //icon: _currenIndex == 0 ? Image.asset('images/message_press.png'): I,
          )
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
        return messagePage;
      case 1:
        if (contactPage == null) {
          contactPage = new ContactPage();
        }
        return contactPage;
      case 2:
        if (mePage == null) {
          mePage = new MePage();
        }
        return mePage;
    }
  }
}


// 这个怎么抽离
class _BottomNavigationBarWidget extends BottomNavigationBar {
  //type: BottomNavigationBarType
}
