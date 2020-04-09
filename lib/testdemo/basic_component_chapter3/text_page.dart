import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/touch_callback.dart';
import 'package:flutter_qyyim/ui/commom_button.dart';

class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              "Hello world",
              textAlign: TextAlign.left,
            ),
            Text(
              "Hello world! I'm Jack. " * 4,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            FlatButton(
              child: Container(width: 50, child: Text('取消')),
              highlightColor: Colors.transparent,
            ),
            SizedBox(
              width: 50,
              height: 32,
              child: FlatButton(
                //为什么要设置左右padding，因为如果不设置，那么会挤压文字空间
                padding: EdgeInsets.symmetric(horizontal: 8),
                //文字颜色
                //textColor: Colours.dark_button_text,
                //按钮颜色
                color: Colors.transparent,
                focusColor: Colors.transparent,
                //画圆角
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                //如果使用FlatButton，必须初始化onPressed这个方法
                onPressed: () {
                },
                child: Text(
                  '搜索',
                  style: TextStyle(fontSize: 14),
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),

            ComMomButton(color: Colors.transparent,),

            Text(
              "Hello world",
              textScaleFactor: 1.5,
            ),
            Text(
              "Hello world",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  height: 1.2,
                  fontFamily: "Courier",
                  background: new Paint()..color = Colors.yellow,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed),
            ),
            Text.rich(TextSpan(children: [
              TextSpan(text: "Home: "),
              TextSpan(
                text: "https://flutterchina.club",
                style: TextStyle(color: Colors.blue),
                //recognizer: _tapRecognizer
              ),
            ])),
            DefaultTextStyle(
              //1.设置文本默认样式
              style: TextStyle(
                color: Colors.red,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.start,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("hello world"),
                  Text("I am Jack"),
                  Text(
                    "I am Jack",
                    style: TextStyle(
                        inherit: false, //2.不继承默认样式
                        color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
