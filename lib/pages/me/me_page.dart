import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/route/route.dart';
import 'package:flutter_qyyim/config/const.dart';
import 'package:flutter_qyyim/pages/me/list_tile_view.dart';
import 'package:flutter_qyyim/pages/search/search.dart';

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
                      /*Navigator.push(context, MaterialPageRoute(
                          builder: (buidContext){
                           return SearchWidget();
                          }
                      ));*/

                      routePush(new SearchWidget());

                    },
                  ),
                ),
                new Center(
                  child: GestureDetector(
                    child: ImItem(
                      imagePath: 'images/icon_me_message.png',
                      title: '设置',
                    ),
                    onTap: (){
                      print("hello");
                      routePush(new SearchWidget());
                    },
                  ),
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
          ),
          ListTileView(
            border: Border(bottom: BorderSide(color: lineColor, width: 0.2)),
            title: 'test',
            isLabel: true,
            label: 'labletx',
            padding: EdgeInsets.symmetric(vertical: 16.0),
            width: 25.0,
            fit: BoxFit.cover,
          )
        ],

      ),
    );
  }

}