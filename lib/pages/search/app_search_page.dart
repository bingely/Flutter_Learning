import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/res/colors.dart';
import 'package:flutter_qyyim/pages/search/search_content.dart';
import 'package:flutter_qyyim/tool/navigator_util.dart';
import 'package:flutter_qyyim/ui/search_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSearchPage extends StatefulWidget {
  @override
  _AppSearchPageState createState() => new _AppSearchPageState();
}

class _AppSearchPageState extends State<AppSearchPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return new Scaffold(
      body: Container(
        // 距离顶部一段距离
        margin: EdgeInsets.only(top: 35.0),
        child: Column(
          children: <Widget>[
            SearchBar(
              onEdit: () {
                //
                print('edit action ....');
              },
              onCancel: () {
                print('cancel action ....');
                NavigatorUtil.goBack(context);
              },
            ),
            Expanded(child: SearchContent())
          ],
        ),
      ),
      backgroundColor: Colours.bg_gray,
    );
  }
}
