import 'package:flutter/material.dart';
import 'package:flutter_qyyim/pages/chat/map/map_search_page.dart';
import 'package:flutter_qyyim/tool/navigator_util.dart';

class MapSearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigatorUtil.pushWithCuperino(context, MapSearchPage());
      },
      child: Container(
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
      ),
    );
  }
}
