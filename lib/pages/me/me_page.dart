import 'package:flutter/material.dart';

import 'ImItem.dart';

class MePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("我的")),
      body: ListView(
        children: <Widget>[
          // 头像部分
          Container(

          ),
          // 列表项
          Container(
            margin: EdgeInsets.only(top: 20.0),
            color: Colors.white,
            child: ImItem(title: '好友动态', imagePath: 'images/icon_me_friends.png',),
          ),
          Container(
            margin: EdgeInsets.only(top: 30.0),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                new Center(
                  child: RaisedButton(
                    child: Text("test"),
                    onPressed: (){
                      print("hello");
                      Navigator.push(context, MaterialPageRoute(
                          builder: (buidContext){
                           // return EmojPage();
                          }
                      ));
                    },
                  ),
                )
                ,
                GestureDetector(
                  child: ImItem(
                    imagePath: 'images/icon_me_message.png',
                    title: '设置',
                  ),
                  onTap: (){
                    print("hello");
                    Navigator.push(context, MaterialPageRoute(
                      builder: (buidContext){
                       // return EmojPage();
                      }
                    ));
                    //routePush(new EmojPage());
                  },
                )
                ,
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Divider(
                    color: Color(0xFFd9d9d9),
                    height: 0.5,
                  ),
                ),
                ImItem(
                  imagePath: 'images/icon_me_message.png',
                  title: '退出',
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Divider(
                    color: Color(0xFFd9d9d9),
                    height: 0.5,
                  ),
                )
              ],
            ),
          )
        ],

      ),
    );
  }

}