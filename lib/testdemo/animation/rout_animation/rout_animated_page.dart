import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/route/fade_route.dart';
import 'package:flutter_qyyim/pages/search/search.dart';
import 'package:flutter_qyyim/testdemo/animation/rout_animation/fade_route.dart';

class RoutAnimatedPage extends StatefulWidget {
  @override
  _RoutAnimatedPageState createState() => new _RoutAnimatedPageState();
}

class _RoutAnimatedPageState extends State<RoutAnimatedPage> {
  @override
  void initState() {
    // TODO: implement initState
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
        title: new Text(''),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            routeTest();
          },
          child: Text('跳转'),
        ),
      ),
    );
  }

  void routeTest() {
    // MaterialPageRoute
    // 左右切换风格
    /* Navigator.push(context, CupertinoPageRoute(
                builder: (context) => SearchWidget()
            ));*/

    // 自定义
    /*Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context,
        Animation animation, Animation secondaryAnimation) {
      return FadeTransition(
        //使用渐隐渐入过渡,
        opacity: animation,
        child: SearchWidget(), //路由B
      );
    }));*/

    // 完全自定义
    Navigator.push(context, FadeRouteWidget(builder: (context) {
      return SearchWidget();
    }));
  }
}
