import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListViewPage extends StatefulWidget {
  @override
  ListViewPageState createState() => new ListViewPageState();
}

class ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: getList());
  }
}

class InfiniteListView extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}

/// 怎么
Widget getList() {
  return ListView(

      /// 该属性表示是否根据子组件的总长度来设置ListView的长度，默认值为false
      shrinkWrap: true,
      padding: EdgeInsets.all(10.0),
      children: <Widget>[
        const Text('I\'m dedicating every day to you'),
        const Text('Domestic life was never quite my style'),
        const Text('When you smile, you knock me out, I fall apart'),
        const Text('And I thought I was so smart'),
      ]);
}

Widget getListBuilder() {
  return ListView.builder(
      itemCount: 100,
      itemExtent: 50.0,
      itemBuilder: (BuildContext context, int index) {
        ListTile(title: Text("$index"));
      });
}

Widget getListSepara() {
  Widget divide1 = Divider(
    color: Colors.blue,
  );
  Widget divide2 = Divider(
    color: Colors.red,
  );

  return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text("$index"));
      },
      separatorBuilder: (BuildContext context, int index) {
        return index / 2 == 0 ? divide1 : divide2;
      },
      itemCount: 100);
}
