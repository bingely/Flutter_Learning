import 'package:flutter/material.dart';

class DecoratedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(''),
      ),
      body: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red, Colors.orange[700]]),//背景渐变
            borderRadius: BorderRadius.circular(3.0), //3像素圆角
            boxShadow: [
              BoxShadow(
                  color:Colors.black54,
                  offset: Offset(2.0,2.0),
                  blurRadius: 4.0
              )
            ]
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 18.0),
            child: Text("login"),
          ),
        ),
      ),
    );
  }
}
