
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/provider/global_model.dart';
import 'package:flutter_qyyim/testdemo/rout/tip_route.dart';
import 'package:provider/provider.dart';

class RouterTestRoute extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<GlobalModel>(context);

    final textSize = Provider.of<double>(context);// 获取字体大小
    return Center(
      child: RaisedButton(
        onPressed: () async {
          // 打开`TipRoute`，并等待返回结果
          /*var result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TipRoute(
                  // 路由参数
                  text: "我是提示xxxx",
                );
              },
            ),
          );*/

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TipRoute(
                  // 路由参数
                  text: "我是提示xxxx",
                );
              },
            ),

          ).then((result){
            print("路由返回值: $result ");
          });
          //输出`TipRoute`路由返回结果
         // print("路由返回值: $result");


        },
        child: Text("打开提示页${_counter.count}字体$textSize"),
      ),
    );
  }
}


