import 'package:flutter/material.dart';

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
          onPressed: (){
            Navigator.push(context, P)
          },
          child: Text('跳转'),
        ),
      ),
    );
  }

}
