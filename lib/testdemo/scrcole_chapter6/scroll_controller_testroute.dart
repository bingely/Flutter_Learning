import 'package:flutter/material.dart';

// 滚动监听及控制
class ScrollControllerTestRoute extends StatefulWidget {
  @override
  ScrollControllerTestRouteState createState() => new ScrollControllerTestRouteState();
}

class ScrollControllerTestRouteState extends State<ScrollControllerTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Scrollbar(
        child: ListView(
          children: <Widget>[

          ],
        ),

      ),
    );
  }
 
}
