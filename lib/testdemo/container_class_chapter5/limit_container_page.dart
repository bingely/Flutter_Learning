import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/ui.dart';

class LimitContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget redBox = DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('5.2 尺寸限制类容器'),
        actions: <Widget>[
          UnconstrainedBox(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Colors.white70),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: 150.0, minWidth: double.infinity //宽度尽可能大
                ),
            child: Container(
              height: 5.0,
              child: redBox,
            ),
          ),
          SizedBox(
            width: 80.0,
            height: 80.0,
            child: redBox,
          ),
          Space(),
          // 多重限制  对于minWidth和minHeight来说，是取父子中相应数值较大的
          ConstrainedBox(
              constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0), //父
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
                //子
                child: redBox,
              )),
          Space(),
          // 对于maxWidth和maxHeight，多重限制的策略是什么样的呢？?? 为啥设置完之后会消失了
          ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 90.0, maxWidth: 120.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 60.0, maxWidth: 90.0),
                child: redBox,
              )),
          Space(),
          //5.2.4 UnconstrainedBox
          ConstrainedBox(
              constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0), //父
              child: UnconstrainedBox(
                //“去除”父级限制
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 190.0, minHeight: 20.0),
                  //子
                  child: redBox,
                ),
              ))
          // UnconstrainedBox
        ],
      ),
    );
  }
}
