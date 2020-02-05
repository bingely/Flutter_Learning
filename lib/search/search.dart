import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/touch_callback.dart';

/// 搜索页面
class SearchWidget extends StatefulWidget {
  @override
  SearchState createState() {
    return SearchState();
  }
}

class SearchState extends State<SearchWidget> {
  // 定义获取焦点
  FocusNode focusNode = new FocusNode();

  //
  _requestFouces() {
    FocusScope.of(context).requestFocus(focusNode);
    return focusNode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 距离顶部一段距离
        margin: EdgeInsets.only(top: 25.0),
        // 总体是垂直布局
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //
            Stack(
              children: <Widget>[
                TouchCallBack(
                  isfeed: false,
                  onPressed: () {
                    //
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 45.0,
                    margin: EdgeInsets.only(left: 12.0, right: 10.0),
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.black,
                    ),
                  ),
                ),

                //
                Container(
                  alignment: Alignment.centerLeft,
                  height: 45.0,
                  margin: EdgeInsets.only(left: 50.0,right: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.green)
                    )
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        //
                        child: TextField(
                          focusNode: _requestFouces(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0
                          ),
                          onChanged: (String text){},
                          decoration: InputDecoration(
                            helperText: 'hint search',
                            border: InputBorder.none
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.mic, color: Color(0xffaaaaaa)),
                      )
                    ],
                  ),
                )
              ],
            ),
            //
            Container(
              margin: EdgeInsets.only(top: 50.0),
              child: Text(
                'search history',
                style: TextStyle(fontSize: 16.0, color: Color(0xffb5b5b5)),
              ),
            ),
            //
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Row(
                //
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //
                children: <Widget>[
                  _getText('friends'),
                  _getText('chat'),
                  _getText('group'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _getText(String s) {
    return TouchCallBack(
      isfeed: false,
      onPressed: () {},
      child:
          Text(s, style: TextStyle(fontSize: 14.0, color: Color(0xff1aad19))),
    );
  }
}
