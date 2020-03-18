import 'package:flutter/material.dart';
import 'package:flutter_qyyim/config/app.dart';
import 'package:flutter_qyyim/ui/commom_bar.dart';


class AllLabelPage extends StatefulWidget {
  @override
  _AllLabelPageState createState() => _AllLabelPageState();
}

class _AllLabelPageState extends State<AllLabelPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new ComMomBar(title: '所有标签'),
      body: new Center(
        child: new Text(
          '您暂时没有标签',
          style: TextStyle(color: AppColors.mainTextColor),
        ),
      ),
    );
  }
}
