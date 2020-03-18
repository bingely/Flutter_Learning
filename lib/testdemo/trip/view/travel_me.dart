import 'package:flutter/material.dart';
import 'package:flutter_qyyim/testdemo/trip/widget/webview.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*body: new WebviewScaffold(
            url: "https://www.baidu.com",
            appBar: new AppBar(title: new Text("Widget webview"))));*/
       body: WebView(
          url: "https://www.baidu.com",
        ),
      /*body: WebviewScaffold(
        userAgent: 'null',
        //防止携程H5页面重定向到打开携程APP ctrip://wireless/xxx的网址
        url: "https://www.baidu.com",
        initialChild: Container(
          color: Colors.white,
          child: Center(
            child: Text('Waiting...'),
          ),
        ),
      ),*/
    );
  }
}
