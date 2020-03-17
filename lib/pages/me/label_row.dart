import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/config/const.dart';

class LabelRow2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0, right: 5.0),
        onPressed: () {},
        child: Container(
          margin: EdgeInsets.only(left: 20.0),
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            border: Border(bottom:BorderSide(color: lineColor, width: mainLineWidth))
          ),
          child: Row(
            children: <Widget>[
              Text('hh'),
              Spacer(),
              new Icon(CupertinoIcons.right_chevron),
            ],
          ),
        ),
      ),
    );
  }
}
