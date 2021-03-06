import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyyim/config/app.dart';

class LabelRow2 extends StatelessWidget {
  VoidCallback onpress;

  String text;

  LabelRow2({this.onpress, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
        onPressed: onpress,
        child: Container(
          margin: EdgeInsets.only(left: 20.0),
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: AppColors.lineColor, width: AppConstants.mainLineWidth))),
          child: Row(
            children: <Widget>[
              Text(text),
              Spacer(),
              new Icon(CupertinoIcons.right_chevron),
            ],
          ),
        ),
      ),
    );
  }
}
