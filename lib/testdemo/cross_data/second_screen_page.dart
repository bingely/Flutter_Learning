import 'package:flutter/material.dart';
import 'package:flutter_qyyim/testdemo/cross_data/custom_event.dart';

import 'event_bus.dart';
import 'first_page.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => new _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(''),
      ),
      body: RaisedButton(
        onPressed: () => eventBus.fire(CustomEvent("hello")),
        child: Text("click"),
      ),
    );
  }
}
