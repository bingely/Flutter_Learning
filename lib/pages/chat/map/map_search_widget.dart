import 'package:flutter/material.dart';
import 'package:flutter_qyyim/tool/navigator_util.dart';
import 'package:flutter_qyyim/ui/commom_button.dart';

class MapSearchWidget extends StatelessWidget {
  Function() onTapClick;

  ValueChanged<String> onChanged;

  TextEditingController controller;

  bool isShow;

  Function() onCancel;

  MapSearchWidget(
      {this.onTapClick,
      this.onChanged,
      this.controller,
      this.isShow,
      this.onCancel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapClick,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: 16),
              padding: EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                  color: Color(int.parse('0xffEDEDED')),
                  borderRadius: BorderRadius.circular(5)),
              child: (!isShow)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[Icon(Icons.search), Text('搜索地址')],
                    )
                  : Container(
                      padding: EdgeInsets.only(left: 10),
                      height: 25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.search),
                          Expanded(
                            child: TextField(
                                controller: controller,
                                onChanged: onChanged,
                                autofocus: true,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300),
                                //输入文本的样式
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(5, 0, 5, 15),
                                  border: InputBorder.none,
                                  hintText: '输入搜索地址',
                                  hintStyle: TextStyle(fontSize: 15),
                                )),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
          (isShow)
              ? ComMomButton(
                  color: Colors.transparent,
                  text: '取消',
                  onTap: onCancel,
                  style: TextStyle(color: Colors.grey),
                )
              : Container(
                  width: 16,
                )
        ],
      ),
    );
  }
}
