import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  @override
  _TextFieldPageState createState() => new _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  //定义一个controller  --- 获取输入内容
  TextEditingController _unameController = TextEditingController();

  // 控制焦点
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    _unameController.addListener(() {
      print('addListener---->${_unameController.text}');
    });

    focusNode1.addListener(() {
      // 获得焦点时focusNode.hasFocus值为true，失去焦点时为false。
      print('focusnode--hasFocus->${focusNode1.hasFocus}');
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('textfield'),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
            hintColor: Colors.grey[200], //定义下划线颜色
            inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.grey), //定义label字体样式
                hintStyle:
                    TextStyle(color: Colors.grey, fontSize: 14.0) //定义提示文本样式
                )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              focusNode: focusNode1,
              controller: _unameController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.person),
                // 未获得焦点下划线设为灰色
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                //获得焦点下划线设为蓝色
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              onChanged: (value) {
                print("onchange--->$value");
              },
              //

            ),
            Container(
              child: TextField(
                focusNode: focusNode2,
                decoration: InputDecoration(
                    labelText: "输入框",
                    hintText: "自定义输入框",
                    prefixIcon: Icon(Icons.lock),

                    // 自定义下划线
                    hintStyle: TextStyle(color: Colors.red, fontSize: 20.0),
                    border: InputBorder.none
                ),
                obscureText: true,
              ),
              decoration: BoxDecoration(
                // 下滑线浅灰色，宽度1像素
                border: Border(bottom: BorderSide(color: Colors.yellow,width: 1.0))
              ),
            ),
            RaisedButton(
              onPressed: () {
                print(_unameController.text);
              },
              child: Text("登录"),
            ),
            RaisedButton(
              onPressed: () {
                //将焦点从第一个TextField移到第二个TextField
                // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                // 这是第二种写法
                if (null == focusScopeNode) {
                  focusScopeNode = FocusScope.of(context);
                }
                focusScopeNode.requestFocus(focusNode2);
              },
              child: Text("移动焦点"),
            ),
            RaisedButton(
              onPressed: () {
                // 当所有编辑框都失去焦点时键盘就会收起
                focusNode1.unfocus();
                focusNode2.unfocus();
              },
              child: Text("收齐键盘"),
            )
          ],
        ),
      ),
    );
  }
}
