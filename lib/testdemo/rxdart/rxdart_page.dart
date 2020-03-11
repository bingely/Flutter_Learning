import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class RxDartPage extends StatefulWidget {

  @override
  _RxDartPageState createState() => new _RxDartPageState();
}

class _RxDartPageState extends State<RxDartPage> {

  @override
  void initState() {
    super.initState();

    List array = [1,2,3,4,5,6];
    Observable.fromIterable(array).map<String>((data) {
      return (data + 1).toString();
    }).doOnListen(() {
      print("被监听");
    }).listen((data) {
      print(data);
    });
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
        title: new Text('rxdart_demo'),
      ),

      body: Column(
        children: <Widget>[

        ],
      ),
    );
  }

}
