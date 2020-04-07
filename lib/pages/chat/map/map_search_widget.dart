import 'package:flutter/material.dart';

class MapSearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      padding: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
          color: Color(int.parse('0xffEDEDED')),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[Icon(Icons.search), Text('搜索地址')],
      ),
    );
  }
}
