import 'package:flutter/material.dart';

/// InheritedWidget
class ShareDataWidget extends InheritedWidget {
//需要在子树中共享的数据，保存点击次数
  final int data;

  ShareDataWidget({this.data, Widget child}) : super(child: child);

  //   //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget of(BuildContext context) {
    //return context.inheritFromWidgetOfExactType(ShareDataWidget);
    // 被刷新的widget的didChangeDependencies()方法就不会回调
    return context.ancestorInheritedElementForWidgetOfExactType(ShareDataWidget).widget;
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    return oldWidget.data != data;
  }
}

class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  _InheritedWidgetTestRouteState createState() {
    return _InheritedWidgetTestRouteState();
  }
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {

  int count = 0;
  @override
  Widget build(BuildContext context) {
    return ShareDataWidget(
      data: count,
      child: Column(
        //
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(ShareDataWidget.of(context).data.toString()),
          ),
          RaisedButton(
            onPressed: () => setState(() => ++count),
            child: Text('click me'),
          )
        ],

      ),
    );
  }
}
