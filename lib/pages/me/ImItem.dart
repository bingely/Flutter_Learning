import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/touch_callback.dart';

// 通用item
class ImItem extends StatelessWidget{
  // 标题
  final String title;
  // 图片路径
  final String imagePath;
  // 备用
  final Icon icon;

  const ImItem({Key key, @required this.title, this.imagePath, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchCallBack(
      onPressed: (){
        // 判断点击的项
        switch (title) {
          case 'aa':

            break;
        }
      },
      // 展示部分
      child: Container(
        height: 50.0,
        child: Row(
          children: <Widget>[
            // 图片
            Container(
              child: imagePath != null
                  ? Image.asset(
                imagePath, width: 32.0, height: 32.0,
              ) : SizedBox(
                height: 32.0,
                width: 32.0,
                child: icon,
              ),
            ),
            // 标题
            Text(
              title,
              style: TextStyle(fontSize: 16.0, color: Color(0xFF353535)),
            )
          ],
        ),
      ),
    );

  }
}