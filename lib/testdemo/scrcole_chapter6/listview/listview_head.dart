import 'package:flutter/material.dart';

class ListViewHeadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('withhead_listview'),
      ),
      body: Column(children: <Widget>[
        Text('head'),
        Expanded(
          child: ListView.builder(itemBuilder: (context, index) {
            return Text('$index');
          }),
        ),
      ]),
    );
  }
}
