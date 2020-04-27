import 'package:flutter/material.dart';
import 'package:flutter_qyyim/common/res/colors.dart';
import 'package:flutter_qyyim/pages/search/search_content.dart';
import 'package:flutter_qyyim/ui/search_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IosPageDemo extends StatefulWidget {

  @override
  _IosPageDemoState createState() => new _IosPageDemoState();
}

class _IosPageDemoState extends State<IosPageDemo> {



  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('dd'),
      ),
      body: Column(
        children: <Widget>[
          SearchBar(
            onEdit: () {
              //
              print('edit action ....');

            },
            onCancel: () {
              print('cancel action ....');
              // 显示底部的TabBar
            },
          ),
          Expanded(child: SearchContent())
        ],
      ),
      backgroundColor: Colours.bg_gray,
    );
  }

}
