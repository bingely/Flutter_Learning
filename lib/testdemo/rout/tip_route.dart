import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/provider/global_model.dart';
import 'package:provider/provider.dart';

class TipRoute extends StatelessWidget {
  TipRoute({
    Key key,
    @required this.text, // 接收一个text参数
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    //final _counter = Provider.of<GlobalModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              Consumer2<GlobalModel,double>(
                builder: (context, _counter, fontsize,child) =>
                  RaisedButton(
                    onPressed: () {
                      _counter.incresement();
                      Navigator.pop(context, "我是返回值$fontsize");
                    },
                    child: child,
                  )
                ,
                child: Text("返回"),
              ),
              TestIcon()
            ],
          ),
        ),
      ),
    );
  }
}

// 用于打印 build 方法执行情况的自定义控件
class TestIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("TestIcon build");
    return Icon(Icons.add); // 返回 Icon 实例
  }
}
