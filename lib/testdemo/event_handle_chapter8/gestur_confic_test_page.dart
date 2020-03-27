import 'package:flutter/material.dart';
import 'package:flutter_qyyim/tool/log_utils.dart';

class GestureDetecotorPage extends StatefulWidget {
  @override
  GestureConflictTestRouteState createState() =>
      new GestureConflictTestRouteState();
}

class GestureConflictTestRouteState extends State<GestureDetecotorPage> {
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            left: _left,
            child: Listener(
              onPointerDown: (details) {
                LogUtil.e("down");
              },
              onPointerUp: (details) {
                //会触发
                LogUtil.e("up");
              },
              child: GestureDetector(
                child: CircleAvatar(child: Text("A")),
                //要拖动和点击的widget
                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _left += details.delta.dx;
                  });
                },
                onHorizontalDragEnd: (details) {
                  LogUtil.e("onHorizontalDragEnd");
                },
                /*onTapDown: (details) {
                  LogUtil.e("down");
                },
                onTapUp: (details) {
                  LogUtil.e("up");
                },*/
              ),
            ),
          )
        ],
      ),
    );
  }
}
