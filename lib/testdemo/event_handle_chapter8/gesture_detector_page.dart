import 'package:flutter/material.dart';
import 'package:flutter_qyyim/tool/log_utils.dart';

class GestureDetectorPage extends StatefulWidget {
  @override
  _GestureDetectorPageState createState() => new _GestureDetectorPageState();
}

class _GestureDetectorPageState extends State<GestureDetectorPage> {
  String _operation = "No Gesture detected!"; //保存事件名
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0;//距左边的偏移
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('GestureDetectorPage'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                width: 200.0,
                height: 100.0,
                child: Text(
                  _operation,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onTap: () => updateText("Tap"), //点击
              onDoubleTap: () => updateText("DoubleTap"), //双击
              onLongPress: () => updateText("LongPress"), //长按
              //手指按下时会触发此回调
              onPanDown: (DragDownDetails e) {
                //打印手指按下的位置(相对于屏幕)
                LogUtil.e("用户手指按下：${e.globalPosition}");
              },
              //手指滑动时会触发此回调
              onPanUpdate: (DragUpdateDetails e) {
                //用户手指滑动时，更新偏移，重新构建
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
                LogUtil.e("onPanUpdateleft--->$_left");
                LogUtil.e("onPanUpdatetop---》$_top");
              },
              onPanEnd: (DragEndDetails e){
                //打印滑动结束时在x、y轴上的速度
                LogUtil.e("onPanEnd${e.velocity}");
              },
            ),
          ],
        ));
  }

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
    LogUtil.e("updateText--->$text");
  }
}
